class ChangeColumnToGyms < ActiveRecord::Migration[5.2]
    def change
      change_column :gyms, :latitude, :float
      change_column :gyms, :longitude, :float
    end
end
