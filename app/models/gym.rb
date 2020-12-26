class Gym < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user, optional: true
    attachment :gym_image
    attachment :profile_image
end
