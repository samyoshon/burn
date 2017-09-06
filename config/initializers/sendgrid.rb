ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => Rails.application.secrets.sendgrid_api_key,
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}