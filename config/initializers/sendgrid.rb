if Rails.env.development? 
	ActionMailer::Base.smtp_settings = {
	  :user_name => 'apikey',
	  :password => ENV["SENDGRID_API_KEY_DEV"],
	  :domain => ENV["SENDGRID_DOMAIN"],
	  :address => ENV["SENDGRID_API_KEY_PROD"],
	  :port => 587,
	  :authentication => :plain,
	  :enable_starttls_auto => true
	}                          # required
elsif Rails.env.production?
	ActionMailer::Base.smtp_settings = {
	  :user_name => 'apikey',
	  :password => ENV["SENDGRID_API_KEY_PROD"],
	  :domain => ENV["SENDGRID_DOMAIN"],
	  :address => ENV["SENDGRID_API_KEY_PROD"],
	  :port => 587,
	  :authentication => :plain,
	  :enable_starttls_auto => true
	}               
end 

