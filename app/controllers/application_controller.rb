class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :set_market
  # layout :layout_by_resource

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
  
  protected

#   def configure_devise_permitted_parameters
#     # devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :market_id]
# # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit (:first_name, :last_name, :email, :password, :password_confirmation)}
#     # devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :market_id]
#     registration_params = [:email, :password, :password_confirmation, :first_name, :last_name, :image_data]

#     if params[:action] == 'update'
#       devise_parameter_sanitizer.for(:account_update) { 
#         |u| u.permit(registration_params << :current_password)
#       }
#     elsif params[:action] == 'create'
#       devise_parameter_sanitizer.for(:sign_up) { 
#         |u| u.permit(registration_params) 
#       }
#     end
#   end

  def configure_devise_permitted_parameters
    registration_params = [:email, :password, :password_confirmation, :first_name, :last_name, :images, :phone_number]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
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
