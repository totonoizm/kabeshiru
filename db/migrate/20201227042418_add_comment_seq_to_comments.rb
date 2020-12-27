class AddCommentSeqToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :comment_seq, :integer
  end
end
