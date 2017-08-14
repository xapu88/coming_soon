class WelcomeController < ApplicationController

  respond_to :html, :js

  def index
    @subscriber = Subscriber.new
  end

  def subscribe
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      # SubscriptionMailer.subscribe_email(@subscriber).deliver_later
      @gb = Gibbon::Request.new
      list = Rails.application.secrets.mailchimp[:list_id]
      begin
        @gb.lists(list).members.create(body: {email_address: @subscriber.email, status: "subscribed", double_optin: false})
        respond_to do |format|
          format.js { return }
          format.html { redirect_to :back }
        end
      rescue Gibbon::MailChimpError => e
        Rails.logger.debug("Subscribing failed: #{e.message}")
        @error_message = get_error_message(e.title)
        respond_to do |format|
          format.js { render "failure.js.erb" }
          format.html { redirect_to :back }
        end
      end
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end

  def get_error_message(title)
    if title == "Member Exists"
      return "Already subscribed. Thank you!"
    elsif title == "Invalid Resource"
      return "Email address not valid."
    else
      return "Subscribe failed. Please try again."
    end
  end

end
