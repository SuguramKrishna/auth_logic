class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:success] = "Welcome back!"
      redirect_to root_path
    else
      render :new
    end
  #   user = User.find_by(email: params[:email])
  # if user.present? && user.authenticate(params[:password])
  #   if user.email_confirmed
  #   redirect_to todolists_path
  #   else
  #       flash.now[:error] = 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
  #       render 'new'
  #   end
  # else
  #    flash.now[:error] = 'Invalid email/password combination' # Not quite right!
  #    render 'new'
  # end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
