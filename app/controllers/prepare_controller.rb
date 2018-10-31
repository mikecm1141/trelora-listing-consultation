class PrepareController < ApplicationController
  def show
    @property_facade = PropertyFacade.new(session[:property_found], current_user.http_auth_token)
  end
end
