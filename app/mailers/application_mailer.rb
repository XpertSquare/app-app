class ApplicationMailer < ActionMailer::Base
  default from: "marius.serban@gmail.com"
  
  def registration_confirmation(account, user)
    @account = account
    @user = user
    
    
    mail(:to => "#{user.username}", :subject => "Registered")
  end
end
