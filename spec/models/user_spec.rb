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
      it '2文字以上であること' do
        test_user.name = Faker::Lorem.characters(number:1)
        is_expected.to eq false;
      end
      it '20文字以下であること' do
        test_user.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false;
      end
    end
  it "ユーザー名、メール、パスワードがある場合有効である" do
    user = User.new(
      name: "yasu",
      email:"test@test",
      password: "password"
      )
      expect(user).to be_valid
  end
  it "ユーザー名がない場合、無効である"
  it "メールがない場合無効である"
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