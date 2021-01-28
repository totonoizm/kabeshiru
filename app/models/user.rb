class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :gyms # ジム登録情報も紐付け　誰が更新、追加したかわかるように。
  has_many :clip_gyms, through: :clips, source: :gym # ユーザーがブックマークしたジムを定義
  
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  
  NGWORD = %w(クソ野郎 糞野郎).freeze
  NGWORD_REGEX = %r{#{NGWORD.join('|')}}.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  attachment :profile_image

  validates :name, presence: true, length: { in: 0..30 }, uniqueness: true, format: { without: NGWORD_REGEX }
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :introduction, length: { maximum: 150 },format: { without: NGWORD_REGEX }
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
    
    # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  
  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  
  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

end
