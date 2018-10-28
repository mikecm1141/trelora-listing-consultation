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

	private

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
		@property_info ||= trelora_service.property_result(@listing_id, @auth_token)
	end

	def trelora_service
		TreloraService.new
	end
end