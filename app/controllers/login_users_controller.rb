class LoginUsersController < ApplicationController
    def create
      email = params[:email]
      password = params[:password]

      user_info = UserInfoFacade.new(email, password)
      session[:addresses] = user_info.get_addresses
      session[:token] = user_info.get_token
      redirect_to login_users_path
      # response = trelora_service.get_user_info(email, password)

      # session[:token] = response[:data][:user][:HTTP_AUTH_TOKEN]
      #
      # addresses_hash = response[:data][:available_address][:addresses]
      #
      # addresses = addresses_hash.map do |key, value|
      #     value[:id]
      # end
    end

    def index
    end

    # private
    #
    # def trelora_service
    #   TreloraService.new
    # end
  end
