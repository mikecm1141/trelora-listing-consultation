require 'rails_helper'

describe 'As a logged in agent' do 
  it 'can generate a form to fill in listing details' do
    visit '/collect' 

    fill_in :about_home, with: 'Updated Kitchen, Eastfacing Patio'
    fill_in :recommended_list_price, with: 123000
    select "Hot", from: :updated_client_enthusiasm
    fill_in :buyer_agent_commission, with: "123"
    fill_in :about_the_seller, with: 'Buying new build condo'
    fill_in :credit_card_number, with: "1111222233334444"
    select "01", from: :cc_month
    select '2018', from: :cc_year

    click_on "Finish"

    expect(page)
  end
end