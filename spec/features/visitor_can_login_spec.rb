require 'rails_helper'

describe 'As a visitor' do
  context 'when the visitor opens the application' do
    it 'allows them to login with email and password' do
      visit '/'

      fill_in :email, with: "steven@trel.co"
      fill_in :password, with: "password"
      click_on "Login"
      expect(current_path).to eq(login_users_path)
      expect(page).to have_content("Pricing Location Address")
      expect(page).to have_content("1860_south_marion_street-Denver-CO-80210")
      expect(page).to have_content("910-portland_place-Boulder-CO-80304")
    end
  end
end
