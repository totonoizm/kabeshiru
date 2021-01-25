class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User" #自分をフォローしているユーザー
    belongs_to :followed, class_name: "User" #自分がフォローしているユーザー
    
    validates :follower_id, presence: true
    validates :following_id, presence: true
end
