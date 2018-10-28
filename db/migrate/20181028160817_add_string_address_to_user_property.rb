class AddStringAddressToUserProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :user_properties, :address, :string
  end
end
