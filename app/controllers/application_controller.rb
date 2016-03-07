class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user

  private 

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end

end
