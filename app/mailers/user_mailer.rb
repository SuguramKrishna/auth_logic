class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to the Authlogic Demo app done by SK')
      end
end

