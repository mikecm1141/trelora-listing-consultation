require 'rails_helper'

describe 'As a logged in agent' do
  it 'can generate a form to fill in listing details' do
    visit '/collect'

    fill_in :about_home, with: 'Updated Kitchen, Eastfacing Patio'
    fill_in :recommended_list_price, with: 123_000
    select 'Hot', from: :updated_client_enthusiasm
    fill_in :buyer_agent_commission, with: '123'
    fill_in :about_the_seller, with: 'Buying new build condo'
    fill_in :credit_card_number, with: '1111222233334444'
    select '01', from: :cc_month
    select '2018', from: :cc_year

    click_on "Finish"

    expect(current_path).to eq('/collect')

    expect(page).to has_field?(:about_home, disabled: true)
    expect(page).to has_field?(:recommended_list_price, disabled: true)
    expect(page).to has_field?(:updated_client_enthusiasm, disabled: true)
    expect(page).to has_field?(:buyer_agent_commission, disabled: true)
    expect(page).to has_field?(:about_the_seller, disabled: true)
    expect(page).to has_field?(:credit_card_number, disabled: true)
    expect(page).to has_field?(:cc_month, disabled: true)
    expect(page).to has_field?(:cc_year, disabled: true)
  end
end
