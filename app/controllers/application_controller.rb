class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def login_required
    redirect_to login_url, alert: "Not authorized. You need to be logged in to access the page requested" if current_user.nil?
  end
    
private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  
  def authorize
    redirect_to login_url, alert: "Not authorized. You need to be logged in to access the page requested" if current_user.nil?
  end
  
end
