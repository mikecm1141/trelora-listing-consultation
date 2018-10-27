class UserProperty < ApplicationRecord
  has_one :property, foreign_key: "listing_id"
end
