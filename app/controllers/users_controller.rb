class UsersController < ApplicationController
  
  def home
      render :home
  end

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to "/users/#{@user.id}"
    else
      redirect_to new_users_path
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def show
    @user = User.find(params[:id])

     if current_user == nil
      redirect_to "/sign_in"
    else
      render :show
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :profile_pic, :description, :current_city)
  end

end
