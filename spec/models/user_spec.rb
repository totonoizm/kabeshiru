require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
  let(:user) { build(:user) }
  subject { test_user.valid? }
  context 'nameカラム' do
    let(:test_user) { user }
    it '空欄でないこと' do
      test_user.name = ''
      is_expected.to eq false;
    end
    it '1文字以上であること' do
      test_user.name = Faker::Lorem.characters(number:0)
      is_expected.to eq false;
    end
    it '30文字以下であること' do
      test_user.name = Faker::Lorem.characters(number:31)
      is_expected.to eq false;
    end
    it "登録済のユーザーネームと重複していないこと" do
      test_user.name = Faker:: Lorem.characters(number:0)
      is_expected.to eq false;
    end
  end
    it "NGWORDが入っていないこと" do
    　test_user.name = Faker::Lorem.characters() 
    end
  context 'emailkaramu'  
  it "メールがない場合無効であcる"
  it "重複したメールの場合無効である"
  it "パスワードがない場合無効である"
end  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
#   pending "add some examples to (or delete) #{__FILE__}"
#   context "データが正しく保存される" do
#     before do
#       @user = User.new
#       @user.name = "yasu"
#       @user.introduction = "今日も晴れです。"
#       @user.save
#     end

#     it "全て入力してあるので保存される" do
#       expect(@user).to be_valid
#     end
#   end

#   context "データが正しく保存されない" do
#     before do
#       @user = User.new
#       @user.name = "Hello WebCamp"
#       @user.introduction = "今日も晴れです。"
#       @user.save
#     end

#     it "titleが入力されていないので保存されない" do
#       expect(@user).to be_invalid
#       expect(@user.errors[:name]).to include("can't be blank")
#     end
#   end
# end