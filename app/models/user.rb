class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :post_image
  attachment :profile_image
  has_many :comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :gyms #ジム登録情報も紐付け　誰が更新、追加したかわかるように。退会しても消えないようにオプションは無し

end
