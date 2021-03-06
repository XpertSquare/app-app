class AccountsController < ApplicationController
  layout 'dashboard', :only => ['edit']
  
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:account_id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new
    @account.name = params[:name]
    @account.status = "active"

   @user = User.find_by_username(params[:email])
   if @user == nil
     @user = User.new
     @user.username = params[:email]
     #generate random password
     @char_map =  [('a'..'z'),('A'..'Z'), (0..9)].map{|i| i.to_a}.flatten
     @user.password = (0...10).map{ @char_map[rand(@char_map.length)] }.join
     logger.info "User password: " + @user.password
     
     @user.password_confirmation = @user.password
   end     
   
   ActiveRecord::Base.transaction do
     @account.save
     @user.save  
     @membership = Membership.new
     @membership.account_id = @account.id
     @membership.user_id = @user.id
     @membership.membership_type = "owner"
     @membership.save
   end
  logger.info "Account ID: " + @account.id.to_s
    respond_to do |format|
    if @account.id > 0 
        #ApplicationMailer.registration_confirmation(@account, @user).deliver         
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
end
