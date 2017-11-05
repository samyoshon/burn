ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => ENV["sendgrid_api_key"],
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}