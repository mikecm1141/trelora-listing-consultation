require 'rails_helper'

RSpec.describe UserProperty, type: :model do
  describe 'Relationships' do
    it { should have_one(:property_id).class_name("Property").with_foreign_key("listing_id") }
  end
end