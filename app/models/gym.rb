class Gym < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user, optional: true
    
    geocoded_by :address
    geocoded_by :state
    after_validation :geocode, if: :address_changed?
    after_validation :geocode, if: :state_changed?
    attachment :gym_image
    attachment :profile_image
end
