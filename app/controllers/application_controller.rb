class ApplicationController < ActionController::Base
  before_action :set_return_path
  protect_from_forgery with: :exception

  def set_return_path
    session[:return_path] ||= request.original_fullpath unless request.original_fullpath == new_user_session_path
  end

  def after_sign_in_path_for(resource)
    if current_user.is_a?(Admin)
      session[:return_path] || admin_tests_path
    else
      session[:return_path] || tests_path
    end
  end
end
