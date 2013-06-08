class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_username(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = {
                                            :value => user.auth_token,
                                            :expires => 1.week.from_now
                                          }        
      else
        cookies[:auth_token] = user.auth_token
      end
      
      redirect_to return_url, :notice => "You are now logged in! "  
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    session[:return_url] = nil
    redirect_to root_url, notice: "You are now logged out!"
  end
  
end
