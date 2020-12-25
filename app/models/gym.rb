class Gym < ApplicationRecord
    has_many :comments, dependent: :destroy
    attachment :gym_image
    attachment :profile_image
    belongs_to :user
end
