require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
      context "データが正しく保存される" do
        before do
          @user = User.new
          @user.name = "yasu"
          @user.introduction = "今日も晴れです。"
          @user.save
        end
        it "全て入力してあるので保存される" do
          expect(@user).to be_valid
        end
      end
      context "データが正しく保存されない" do
        before do
          @user = User.new
          @user.name = "Hello WebCamp"
          @user.introduction = "今日も晴れです。"
          @user.save
        end
        it "titleが入力されていないので保存されない" do
          expect(@user).to be_invalid
          expect(@user.errors[:name]).to include("can't be blank")
        end
      end
end
