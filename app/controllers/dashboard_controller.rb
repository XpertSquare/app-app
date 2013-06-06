class DashboardController < ApplicationController
  
  before_filter :login_required
  
  def index
      @account = Account.find(params[:account_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
    
  end
end