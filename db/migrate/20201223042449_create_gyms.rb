class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      
      t.string :name
      t.text :introduction
      t.string :tel
      t.string :gym_image_id
      t.string :state
      t.string :address
      t.string :postcode
      t.string :url
      t.string :open_time
      t.string :price
      t.string :holiday
      t.string :access
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
