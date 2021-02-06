class Gym < ApplicationRecord
  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/.freeze
  NGWORD = %w(クソ野郎 糞野郎).freeze
  NGWORD_REGEX = %r{#{NGWORD.join('|')}}.freeze

  has_many :comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :clip_gyms, through: :clips, source: :gym # ユーザーがブックマークしたジムを定義
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  attachment :gym_image

  validates :name, presence: true, length: { in: 2..50 }, uniqueness: true, format: { without: NGWORD_REGEX }
  validates :introduction, length: { in: 0..500 }, format: { without: NGWORD_REGEX }, allow_blank: true
  validates :tel, format: { with: VALID_PHONE_NUMBER_REGEX }, uniqueness: true, allow_blank: true
  validates :address, uniqueness: true, format: { without: NGWORD_REGEX }, allow_blank: true
  validates :url, uniqueness: true, format: { without: NGWORD_REGEX }, allow_blank: true
  validates :open_time, length: { maximum: 150 }, format: { without: NGWORD_REGEX }
  validates :price, length: { maximum: 200 }, format: { without: NGWORD_REGEX }
  validates :holiday, length: { maximum: 200 }, format: { without: NGWORD_REGEX }
  validates :access, length: { maximum: 500 }, format: { without: NGWORD_REGEX }

  def cliped_by?(user) # ジムをブックマークしてあるかどうか
    clips.where(user_id: user.id).exists?
  end
end
