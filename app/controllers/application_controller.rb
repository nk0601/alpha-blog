class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # make methods available to the views
  helper_method :current_user, :logged_in?
  
  def current_user
    #avoid multiple DB hits, use memoization ||=
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged to perform that action"
      redirect_to root_path
    end
  end

end