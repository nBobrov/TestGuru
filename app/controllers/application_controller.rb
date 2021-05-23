class ApplicationController < ActionController::Base
  before_action :store_location!,
                unless: -> { devise_controller? || request.xhr? || request.fullpath == root_path },
                if: -> { request.get? && is_navigational_format? }
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  protect_from_forgery with: :exception

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def store_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource)
    set_flash_message! :notice, :signed_in_custom, :first_name => resource.first_name, :last_name => resource.last_name
    if current_user.is_a?(Admin)
      stored_location_for(resource) || admin_tests_path
    else
      stored_location_for(resource) || tests_path
    end
  end

  def default_url_options
    { lang: I18n.locale}
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
