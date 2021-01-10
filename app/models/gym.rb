class Gym < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :clips, dependent: :destroy
    has_many :clip_gyms, through: :clips, source: :gym #ユーザーがブックマークしたジムを定義
    belongs_to :user, optional: true
    
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    attachment :gym_image
    
    validates :postcode, format: {with: /\A[0-9]{5,6}\z/}
    validates :postcode, format: {without: /\A[1-3][0-9]{5}\z/}
    validates :name, presence: true, length: {in: 3..30 },uniqueness: true
    validates :introduction, length: {in: 0..140 }
    # validate :tel, /\A[0-9]+\z/
    validates :address, uniqueness: true
    validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
    validates :open_time, format: /\A#{URI::regexp(%w(http https))}\z/
    validates :price, format: /\A#{URI::regexp(%w(http https))}\z/
    validates :holiday, format: /\A#{URI::regexp(%w(http https))}\z/
    validates :access,format: /\A#{URI::regexp(%w(http https))}\z/
    
    def cliped_by?(user) #ジムをブックマークしてあるかどうか
        clips.where(user_id: user.id).exists?
    end
end
