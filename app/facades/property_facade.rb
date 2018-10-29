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
	end

	def phone
		property_info[:client][:client_info][:phone]
	end

  # Displayeds together in the view
  # Lat: xxx, Long: xxx
  # http://google.com/maps/lat&long
	def longitude
	end

	def latitude
	end

	def opted_in
	end

	def zillow_zestimate_low
	end

	def zillow_zestimate_high
	end

	def zillow_zestimate
	end

	def home_junction_low
	end

	def home_junction_high
	end

	def home_junction_regional_average
	end

	def enthusiasm
	end

	def timing
	end

	def adopter_type
	end

	def updates
		[interior_update, exterior_update].join('<br />')
	end

	def stage
	end

	def retainer
	end

	private

	def interior_update
	end

	def exterior_update
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
