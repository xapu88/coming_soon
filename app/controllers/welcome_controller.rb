class WelcomeController < ApplicationController

  def index
    @subscriber = Subscriber.new
  end

  def subscribe
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      SubscriptionMailer.subscribe_email(@subscriber).deliver_later
    else
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end

end
