class WelcomeWorker < BaseWorker
  include Sidekiq::Worker

  def perform(user)
    # Do something
    UserMailer.welcome_email(user).deliver
  end
end
