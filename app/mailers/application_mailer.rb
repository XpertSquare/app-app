class ApplicationMailer < ActionMailer::Base
  default from: "marius.serban@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    
    mail(:to => "#{user.username}", :subject => "Registered")
  end
end
