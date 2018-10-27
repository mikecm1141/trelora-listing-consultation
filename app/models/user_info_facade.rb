class UserInfoFacade
  def initialize(data)
    @email = data[:email]
    @password = data[:password]
  end

  def get_addresses
    addresses_hash = get_user_info[:data][:available_address][:addresses]
    addresses_hash.map do |_, value|
      value[:id]
    end
  end

  def get_token
    user_info[:data][:user][:HTTP_AUTH_TOKEN]
  end

  def user_info
    ||= trelora_service.get_user_info(@email, @password)
  end

  private

  def trelora_service
    TreloraService.new
  end

end
