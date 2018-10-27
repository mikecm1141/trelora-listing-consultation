class UserInfoFacade
  def initialize(email, password)
    @email = email
    @password = password
  end

  def get_addresses
    addresses_hash = get_user_info[:data][:available_address][:addresses]
    addresses = addresses_hash.map do |key, value|
        value[:id]
    end
  end

  def get_token
    get_user_info[:data][:user][:HTTP_AUTH_TOKEN]
  end

  private

  def trelora_service
    TreloraService.new
  end

  def get_user_info
    info ||= trelora_service.get_user_info(@email, @password)
  end
end
