class UserProperty < ApplicationRecord
	belongs_to :user
	after_create :stringify_listing_id

	private

	def stringify_listing_id
		self.address = self.listing_id.gsub(/([-_])/, ' ').downcase
		self.save
	end
end
