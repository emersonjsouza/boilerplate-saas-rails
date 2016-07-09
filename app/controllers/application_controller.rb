class ApplicationController < ActionController::Base

  #before_filter :load_schema, :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :subdomain_in_black

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def subdomain_in_black
    request.subdomain.blank? || BoilerplateSaasRails::SUBDOMAINS.include?(request.subdomain)
  end

  def load_schema
    #Apartment::Database.switch('public')
    #return unless request.subdomain.present?

    # if user_signed_in?
    #   Apartment::Database.switch(current_user.username)
    # end
  end
end
