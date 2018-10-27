class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :listing_id
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
