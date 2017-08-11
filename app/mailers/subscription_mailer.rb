class SubscriptionMailer < ApplicationMailer
  def subscribe_email(subscriber)
    @subscriber = subscriber
    mail(to: ['hkalanj@gmail.com', 'kurdy.mazen@gmail.com'], subject: 'Stylemyle - New subscription')
  end
end
