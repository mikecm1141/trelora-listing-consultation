class SessionsController < ApplicationController
    def create
        email = params[:email]
        password = params[:password]

        response = trelora_service.get_user_info(email, password)

        session[:token] = response[:data][:user][:HTTP_AUTH_TOKEN]
        
        addresses_hash = response[:data][:available_address][:addresses]
        
        addresses = addresses_hash.map do |key, value|
            value[:id]
        end

        session[:addresses] = addresses  
        redirect_to find_path
    end

    private

    def trelora_service
        TreloraService.new
    end
end