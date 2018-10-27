class CreateUserProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_properties do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true
      t.string :listing_id
    end
  end
end
