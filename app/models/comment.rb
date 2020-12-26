class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :gym
    
    
    #クラスメソッド　一つのジムに対して何回コメントしたかを取得
    def users_comment_count
       user.comments.where(gym_id:self.gym_id).count
    end
end
