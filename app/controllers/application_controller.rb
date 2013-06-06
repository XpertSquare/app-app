class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def login_required
    redirect_to('/') if current_user.blank?
  end
    
private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
end
