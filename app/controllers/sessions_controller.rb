class SessionsController < ApplicationController
    def create
        email = params[:email]
        password = params[:password]

        conn = Faraday.new(url: "https://www.trylora.com")
        response = conn.get("/api/v0/turing/members?email=#{email}&password=#{password}")

        result = JSON.parse(response.body)

        session[:token] = result["data"]["user"]["HTTP_AUTH_TOKEN"]
        
        addresses_hash = result["data"]["available_address"]["addresses"]
        
        addresses = addresses_hash.map do |key, value|
            value["id"]
        end

        session[:addresses] = addresses
        
        redirect_to find_path
    end
end