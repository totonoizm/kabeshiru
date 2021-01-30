require 'rails_helper'

RSpec.describe Relationship, type: :model do

  let(:user) { create(:user) }             # => フォローしているユーザ
  let(:other_user) { create(:other_user) } # => フォローされているユーザ
  let(:true) { user.relationships.build(followed_id: other_user.id) }
  subject { active }

  # リレーションシップが有効であること
  it { should be_valid }

  # follow/followedメソッド
  describe "follower/followed methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    # followメソッドは、フォローしているユーザを返すこと
    it "follower method return following-user" do
      expect(active.follower). to eq user
    end
    # followerメソッドは、フォローされているユーザを返すこと
    it "followed method return followed-user" do
      expect(active.followed). to eq other_user
    end
    # or
    # its(:follower) { should eq user }
    # its(:followed) { should eq other_user }
  end

  # validations
  describe "validations" do
    # 存在性 presence
    describe "presence" do
      it { is_expected.to validate_presence_of :followed_id }
      it { is_expected.to validate_presence_of :follower_id }
    end
  end
end