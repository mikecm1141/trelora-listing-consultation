require 'spec_helper'
require 'faraday'
require 'json'
require './app/facades/property_facade'
require './app/services/trelora_service'

describe PropertyFacade do

	subject { PropertyFacade.new('1860_south_marion_street-Denver-CO-80210', 'this_is_a_very_simple_auth_token_string') }

	it 'exists with standard attributes' do
		expect(subject).to be_a(PropertyFacade)
		expect(subject.name).to eq('Tyler Long')
		expect(subject.full_address).to eq('1860 South Marion Street  Denver CO 80210')
	end
end