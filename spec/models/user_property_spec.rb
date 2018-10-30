require 'rails_helper'

RSpec.describe UserProperty, type: :model do
  it { should belong_to :user }
end
