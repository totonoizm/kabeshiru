FactoryBot.define do
  factory :relationship do
    association :followed
    association :follower
    # followed フォローされている
    # follower フォローしている
  end
end