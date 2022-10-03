class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      WelcomeWorker.perform_async(@user.id)
      flash[:success] = "Account registered!"
      # UserMailer.registration_confirmation(@user).deliver_now
      # redirect_to sign_in_path, notice: "Successfully Created"
      redirect_to sign_in_path
    else
      render :new
    end

    # def confirm_email
    #   user = User.find_by_confirm_token(params[:id])
    #   if user
    #     user.email_activate
    #     flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
    #     Please sign in to continue."
    #     redirect_to sign_in_path
    #   else
    #     flash[:error] = "Sorry. User does not exist"
    #     redirect_to root_path
    #   end
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
