class ApplicationController < ActionController::Base
  before_action :user_role
  before_action :authenticate_user! 
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    
  end
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  private
  
  def user_role
    user = User.find(1)
    @user_role=current_user ? current_user : user
  end
  
  
end