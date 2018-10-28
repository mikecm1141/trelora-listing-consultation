class UserInfoFacade
  def initialize(data)
    @email    = data[:email]
    @password = data[:password]
  end

  def addresses
    addresses_hash = user_info[:data][:available_address][:addresses]
    addresses_hash.map do |_, value|
      value[:id]
    end
  end

  def name
    user_info[:data][:user][:name]
  end

  def email
    user_info[:data][:user][:email]
  end

  def token
    user_info[:data][:user][:HTTP_AUTH_TOKEN]
  end

  def error_msg
    user_info[:data][:error]
  end

  def status_code
    user_info[:data][:status]
  end

  def user_info
   @user_info ||= trelora_service.get_user_info(@email, @password)
  end

  private

  def trelora_service
    TreloraService.new
  end
end
