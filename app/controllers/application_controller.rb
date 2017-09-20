class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_market
  layout :layout_by_resource
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :market_id]
# devise_parameter_sanitizer.for(:sign_up) { |u| u.permit (:first_name, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :market_id]
  end

  private 
  def layout_by_resource
    if devise_controller?
      "market"
    else
      "application"
    end
  end

  def set_market
    @market = Market.find_by_subdomain!(request.subdomain) unless request.subdomain.empty?
  end
end
