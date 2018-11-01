class ApplicationController < ActionController::Base
  helper_method :current_user,
                :current_property

  def current_user
    @current_user ||= User.find_by_http_auth_token(session[:token])
  end

  def current_property
    @current_property ||= session[:property]
  end
end
