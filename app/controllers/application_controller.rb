class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private
  def require_login
    if !current_user
      flash[:error]= "You must be logged in to access this section"
      redirect_to sign_in_path
    end
  end


end
