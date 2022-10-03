class WelcomeWorker < BaseWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform(user_id)
    # Do something
    @user = User.find(user_id)
    UserMailer.with(user: @user).welcome_email.deliver_now  
  end
end
