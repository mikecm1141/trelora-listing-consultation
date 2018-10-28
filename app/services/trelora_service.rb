class TreloraService
  def get_user_info(email, password)
    get_json("/api/v0/turing/members?email=#{email}&password=#{password}")
  end

  def property_result(listing_id, auth_token)
    get_json("/api/v0/turing/properties?HTTP_AUTH_TOKEN=#{auth_token}&address=#{listing_id}")[:result]
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://www.trylora.com")
  end
end