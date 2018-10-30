class PropertyFacade
  def initialize(listing_id, auth_token)
    @listing_id = listing_id
    @auth_token = auth_token
  end

  def name
    property_info[:client][:client_info][:name]
  end

  def full_address
    [street_address1, street_address2, city, state, zip].join(' ')
  end

  def email
    property_info[:client][:client_info][:email]
  end

  def phone
    property_info[:client][:client_info][:phone]
  end

  # Displayeds together in the view
  # Lat: xxx, Long: xxx
  # http://google.com/maps/lat&long
  def longitude
    property_info[:listing][:coordinates][:longitude]
  end

  def latitude
    property_info[:listing][:coordinates][:latitude]
  end

  def opted_in?
    opted_status[property_info[:client][:opted_in][:result]]
  end

  def zillow_zestimate_low
    property_info[:pricing_estimates][:zillow][:low]
  end

  def zillow_zestimate_high
    property_info[:pricing_estimates][:zillow][:high]
  end

  def zillow_zestimate
    property_info[:pricing_estimates][:zillow][:zestimate]
  end

  def home_junction_low
    property_info[:pricing_estimates][:home_junction][:low]
  end

  def home_junction_high
    property_info[:pricing_estimates][:home_junction][:high]
  end

  def home_junction_regional_average
    property_info[:pricing_estimates][:home_junction][:regional_avg]
  end

  def enthusiasm
    property_info[:client][:enthusiasm]
  end

  def timing
    property_info[:client][:timing]
  end

  def adopter_type
    property_info[:client][:adopter_type]
  end

  def updates
    [interior_update, exterior_update]
  end

  def stage
    property_info[:client][:stage]
  end

  def retainer
    "$500"
  end

  def found_us
    property_info[:client][:found_us]
  end

  private

  def interior_update
    property_info[:listing][:home_updates][:exterior]
  end

  def exterior_update
    property_info[:listing][:home_updates][:interior]
  end

  def opted_status
    {
      true => 'Yes',
      false => 'No'
    }
  end

  def street_address1
    property_info[:listing][:address][:address1]
  end

  def street_address2
    property_info[:listing][:address][:address2]
  end

  def city
    property_info[:listing][:address][:city]
  end

  def state
    property_info[:listing][:address][:state]
  end

  def zip
    property_info[:listing][:address][:zip]
  end

  def property_info
    @property_info ||= trelora_service.property_result(@listing_id, @auth_token)[:result]
  end

  def trelora_service
    TreloraService.new
  end
end
