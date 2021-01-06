class Gym < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :clips, dependent: :destroy
    has_many :clip_gyms, through: :clips, source: :gym #ユーザーがブックマークしたジムを定義
    belongs_to :user, optional: true
    
    # geocoded_by :state
    geocoded_by :address
    # after_validation :geocode, if: :state_changed?
    after_validation :geocode, if: :address_changed?
    attachment :gym_image
    attachment :profile_image
    
    def cliped_by?(user) #ジムをブックマークしてあるかどうか
        clips.where(user_id: user.id).exists?
    end
end
