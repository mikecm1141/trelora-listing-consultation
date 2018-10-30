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
    expect(subject.email).to eq('tyler+12@trelora.com')
    expect(subject.phone).to eq('3033333333')
    expect(subject.latitude).to eq('39.683019')
    expect(subject.longitude).to eq('-104.971964')
    expect(subject.opted_in?).to eq('Yes')
    expect(subject.zillow_zestimate_high).to eq(754_000)
    expect(subject.zillow_zestimate_low).to eq(696_000)
    expect(subject.zillow_zestimate).to eq(704_000)
    expect(subject.home_junction_low).to eq(578_000)
    expect(subject.home_junction_high).to eq(679_000)
    expect(subject.home_junction_regional_average).to eq(689_000)
    expect(subject.enthusiasm).to eq('Interested in Moving Forward')
    expect(subject.timing).to eq('Less than 2 Months')
    expect(subject.adopter_type).to eq('Early Adopter')
    expect(subject.updates).to eq(['New Roof in 07/15', 'Basement Updated and Finished 8/2016'])
    expect(subject.stage).to eq('Just getting interested in prepping home for sale. Wants to sell and use $$ to buy with us as well.')
    expect(subject.retainer).to eq('$500')
    expect(subject.found_us).to eq('Google Search')
  end
end
