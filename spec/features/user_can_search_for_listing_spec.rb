require 'rails_helper'

feature 'User searches for a property' do
  context 'via /find-property' do
    it 'allows them to search for a valid listing' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      user.user_properties.create(listing_id: '1860_south_marion_street-Denver-CO-80210')

      visit '/find-property'

      expect(page).to have_content('Pricing Location Address')

      search_address = '1860 South Marion Street Denver CO 80210'

      fill_in :address, with: search_address
      click_on 'Find Location'

      expect(current_path).to eq('/prepare')
      expect(page).to have_content(search_address)
    end

  it 'returns error message if address is invalid' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/find-property'

    search_address = 'invalid address'

    fill_in :address, with: search_address
    click_on 'Find Location'

    expect(current_path).to eq('/find-property')
    expect(page).to have_content('* Address Not Found')
  end
 end
end
