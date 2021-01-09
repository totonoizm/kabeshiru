class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :gyms #ジム登録情報も紐付け　誰が更新、追加したかわかるように。退会しても消えないようにオプションは無し
  has_many :clip_gyms, through: :clips, source: :gym #ユーザーがブックマークしたジムを定義
  
    def active_for_authentication?
        super && (self.is_deleted === false)
    end
end
