class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]


	protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  # def authenticate_user!
  #   if user_signed_in?
  #     super
  #   else
  #     redirect_to login_path, :notice => 'if you want to add a notice'
  #     ## if you want render 404 page
  #     ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
  #   end
  # end


end
