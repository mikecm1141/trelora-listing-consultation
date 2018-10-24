require 'rails_helper'

describe 'As a visitor' do
    context 'when the visitor opens the application' do
        it 'allows them to login with email and password' do
            visit '/'
            
            fill_in :email, with: "steven@trel.co"
            fill_in :password, with: "password"
            click_on "Login"

            expect(current_path).to eq("/find")
            expect(page).to have_content("Pricing Location Address")
            expect(page).to have_content("")
        end
    end
end