class LoginUsersController < ApplicationController
  def create
    email = params[:email]
    password = params[:password]

    user_info = UserInfoFacade.new(email, password)
    session[:addresses] = user_info.get_addresses
    session[:token] = user_info.get_token
    redirect_to login_users_path
  end

  def index
    @addresses = session[:addresses]
  end
end
