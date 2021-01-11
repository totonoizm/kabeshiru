class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  
  NGWORD = %w(クソ野郎 糞野郎).freeze
  NGWORD_REGEX = %r{#{NGWORD.join('|')}}.freeze
  
  validates :comment_seq, uniqueness: { scope: [:user_id, :gym_id] }
  validates :comment, presence: true, length: { maximum: 500 }, format: { without: NGWORD_REGEX }

  attachment :comment_image
  # #クラスメソッド　一つのジムに対して何個コメントしたかを取得
  # def users_comment_count
  #   user.comments.where(gym_id:self.gym_id).count
  # end

  def comment_seq_count
    comment_seq = Comment.where(gym_id: gym_id, user_id: user_id).maximum(:comment_seq)
    # 同Gym,Userにcomment_seqが存在すればcomment_seqの最大値に+1した値が次のコメントのcomment_seqとなる
    # 同Gym,Userにcomment_seqが存在しなければ次のコメントのcomment_seqは初期値の1となる
    if comment_seq
      comment_seq += 1
    else
      comment_seq = 1
    end
  end
end
