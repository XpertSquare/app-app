ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "example.com",
  :user_name            => ENV["GMAIL_USERNAME"],
  :password             => ENV["GMAIL_PASSWORD"],
  :authentication       => :plain,
  :enable_starttls_auto => true, 
  :openssl_verify_mode  => 'none'
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"