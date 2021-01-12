class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :gyms # ジム登録情報も紐付け　誰が更新、追加したかわかるように。
  has_many :clip_gyms, through: :clips, source: :gym # ユーザーがブックマークしたジムを定義
       
  NGWORD = %w(クソ野郎 糞野郎).freeze
  NGWORD_REGEX = %r{#{NGWORD.join('|')}}.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  attachment :profile_image

  validates :name, presence: true, length: { in: 1..30 }, uniqueness: true, format: { without: NGWORD_REGEX }
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :introduction, length: { maximum: 150 },format: { without: NGWORD_REGEX }
  def active_for_authentication?
    super && (is_deleted === false)
  end
end
