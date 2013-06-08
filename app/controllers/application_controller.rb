class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :authorize
  
  def login_required
    redirect_to login_url, alert: "Not authorized. You need to be logged in to access the page requested" if current_user.nil?
  end
    
private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  
  def authorize!(return_url = request.url)
    unless current_user
      set_return_url(return_url)
      redirect_to login_url, alert: "Not authorized. You need to be logged in to access the page requested "
    end   
  end
  
  def initialize_account
    @account = Account.find(params[:account_id])
  end
  
  def set_return_url(path, overwrite = false)
    if overwrite or session[:return_url].blank?
      session[:return_url] = path
    end
  end
    
  def return_url
    session[:return_url] ? session[:return_url] : root_path
  end
  
end
