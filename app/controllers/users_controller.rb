class UsersController < ApplicationController
  
  before_filter :authorize!, :initialize_account
  layout 'dashboard'
  
  def index
     
     @memberships = @account.memberships.includes(:user)
     

    respond_to do |format|
      format.html # index.html.erb     
    end
  end
  
  def new
    @user = User.new
    @membership_type = 'staff'
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, :account_id => params[:account_id], notice: 'The user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @membership_type = params[:membership_type]
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        @membership = Membership.new
        @membership.account_id = @account.id
        @membership.user_id = @user.id
        @membership.membership_type = params[:membership_type]
        @membership.save
        
        format.html { redirect_to users_path, :account_id => params[:account_id], notice: 'The user' + @user.username + ' was successfully created.' }
        
      else
        format.html { render action: "new" }        
      end
    end    
  end
  
  def destroy
    @user = User.find(params[:id])
    @username = @user.username
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, :account_id => params[:account_id], notice: 'The user' + @username + ' was successfully deleted.' }
      
    end
  end
end