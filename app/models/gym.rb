class Gym < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user
    attachment :gym_image
    attachment :profile_image
end
