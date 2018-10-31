class PrepareController < ApplicationController
  after_action :session_prop
  def show
    @property_facade = PropertyFacade.new(session[:property_found], current_user.http_auth_token)
  end

  private

  def session_prop
    session[:property] = @property_facade
  end
end
