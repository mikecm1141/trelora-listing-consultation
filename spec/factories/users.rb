FactoryBot.define do
  factory :user do
    name  				  { 'Test' }
    email 				  { 'steven@trel.co' }
    http_auth_token { 'this_is_a_very_simple_auth_token_string' }
  end
end
