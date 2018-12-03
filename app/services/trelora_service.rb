class TreloraService
  def get_user_info(email, password)
    get_json("/api/v0/turing/members?email=#{email}&password=#{password}")
  end

  def property_result(listing_id, auth_token)
    get_json("/api/v0/turing/properties?HTTP_AUTH_TOKEN=#{auth_token}&address=#{listing_id}")
  end

  def send_consultation_info(auth_token, payload)
    post_json("/api/v0/turing/update_listing_consultation?HTTP_AUTH_TOKEN=#{auth_token}", payload)
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def post_json(url, payload)
    # conn.post(url, payload)
    conn.post do |request|
      request.url url
      request.headers['Accept'] = 'application/json'
      request.body = payload
    end
  end

  def conn
    Faraday.new(url: "https://trylora.herokuapp.com/")
  end
end
