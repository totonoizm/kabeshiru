class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
      
      t.integer :user_id
      t.integer :gym_id
      t.timestamps
    end
  end
end
