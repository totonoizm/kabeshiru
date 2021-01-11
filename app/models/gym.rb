class Gym < ApplicationRecord
  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/.freeze
  NGWORD = %w(クソ野郎 糞野郎).freeze
  NGWORD_REGEX = %r{#{NGWORD.join('|')}}.freeze

  has_many :comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :clip_gyms, through: :clips, source: :gym # ユーザーがブックマークしたジムを定義
  belongs_to :user, optional: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  attachment :gym_image

  validates :postcode, format: { without: /\A[1-3][0-9]{5}\z/ }
  validates :name, presence: true, length: { in: 3..30 }, uniqueness: true, format: { without: NGWORD_REGEX }
  validates :introduction, length: { in: 0..140 }, format: { without: NGWORD_REGEX }
  validates :tel, format: { with: VALID_PHONE_NUMBER_REGEX }, uniqueness: true
  validates :address, uniqueness: true, format: { without: NGWORD_REGEX }
  validates :url, uniqueness: true, format: { without: NGWORD_REGEX }
  validates :open_time, length: { maximum: 50 }, format: { without: NGWORD_REGEX }
  validates :price, length: { maximum: 50 }, format: { without: NGWORD_REGEX }
  validates :holiday, length: { maximum: 70 }, format: { without: NGWORD_REGEX }
  validates :access, uniqueness: true, length: { maximum: 100 }, format: { without: NGWORD_REGEX }

  def cliped_by?(user) # ジムをブックマークしてあるかどうか
    clips.where(user_id: user.id).exists?
  end
end
