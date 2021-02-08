class CreateCommentImages < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_images do |t|
      
      t.integer :comment_id
      t.string :image_id
      t.timestamps
    end
  end
end
