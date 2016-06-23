class SessionsController < ApplicationController
  # before_action :require_login, except: [:new]
  # skip_before_filter :require_login

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to sign_in_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end
