class UsersController < ApplicationController
  before_action :require_login, only: [:index, :edit]



  def home
      render :home
  end

  def index
    @users = User.all.order(id: :desc)
    render :index
  end

  def visit
    @user = current_user
    @venue = Venue.find(params[:id])
    @user.venues.push(@venue)
    redirect_to @user
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.admin != true
      @user.admin = false
    end
    if @user.save
      login(@user)
      flash[:success] = "Welcome to Open-Mic!"
      redirect_to "/users/#{@user.id}"
    else
      redirect_to new_user_path, flash: {error: @user.errors.full_messages.to_sentence}
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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.admin
      redirect_to @user
    else
    session.delete(:user_id)
    redirect_to "/"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :profile_pic, :description, :current_city, :email_confirmation, :password_confirmation, :admin)
  end

end
