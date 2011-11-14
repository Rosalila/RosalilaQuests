class ApplicationController < ActionController::Base
   protect_from_forgery   
   helper_method :current_user, :logged_in?, :verify_authentication
   
  protected  
   
  def current_user   
    @current_user ||= User.find(session[:user_id]) if session[:user_id]   
  end   
   
  def verify_authentication
    redirect_to root_url, :alert => "You need to be logged in to do that." unless logged_in?
  end
  
  def logged_in?
    current_user.present?
  end
  
  
 
end
