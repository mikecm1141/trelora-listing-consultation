require 'rails_helper'

describe 'As a logged in agent' do
  it 'can generate a form to fill in listing details' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.user_properties.create(listing_id: '1860_south_marion_street-Denver-CO-80210')

    visit '/find-property'

    search_address = '1860 South Marion Street Denver CO 80210'

    fill_in :address, with: search_address
    click_on 'Find Location'
    click_link 'Collect'

    expect(current_path).to eq('/collect')

    fill_in :about_home, with: 'Updated Kitchen, Eastfacing Patio'
    fill_in :recommended_list_price, with: 123_000
    select 'Hot', from: :update_client_enthusiasm
    fill_in :buyer_agent_commission, with: '123'
    fill_in :about_the_seller, with: 'Buying new build condo'
    fill_in :credit_card_number, with: '1111222233334444'
    select '01', from: :cc_month
    select '2018', from: :cc_year

    click_on 'Finish'

    expect(current_path).to eq('/collect')

    expect(page).to has_field?(:about_home, disabled: true)
    expect(page).to has_field?(:recommended_list_price, disabled: true)
    expect(page).to has_field?(:update_client_enthusiasm, disabled: true)
    expect(page).to has_field?(:buyer_agent_commission, disabled: true)
    expect(page).to has_field?(:about_the_seller, disabled: true)
    expect(page).to has_field?(:credit_card_number, disabled: true)
    expect(page).to has_field?(:cc_month, disabled: true)
    expect(page).to has_field?(:cc_year, disabled: true)
  end
end
