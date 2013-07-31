class ServicesController < ApplicationController
  
  before_filter :authorize!, :initialize_account
  layout 'dashboard'
  
  def index
      @services = @account.services
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @services }
      end
    
  end
end
