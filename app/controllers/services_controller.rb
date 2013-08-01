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
  
   def new
    @service = Service.new    
  end
  
    def create
    @service = Service.new(params[:service])
    @service.account_id = params[:account_id]

    respond_to do |format|
      if @service.save
        
        
        format.html { redirect_to services_path, :account_id => params[:account_id], notice: 'The service ' + @service.name + ' was successfully created.' }
        
      else
        format.html { render action: "new" }        
      end
    end    
  end
  
  
  
end
