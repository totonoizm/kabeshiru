require 'rails_helper'

RSpec.describe User, type: :model do
    # subject〜を書くことでis_expected〜を使えるようになる
    # 備忘録：letが呼び出された時点で実行される
    # 備忘録：createはDBに保存されるがbuildは保存されない
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      let(:test_user_2) { build(:user) }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
      it 'nilでないこと' do
        test_user.name = nil
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
        test_user.name = "taro"
        test_user.save
        test_user_2.name = "taro"
        test_user_2.save
        expect(test_user_2).to be_invalid
      end
      it "NGWORDが入っていないこと" do
      　test_user.name = Faker::Lorem.characters() 
      end
    end
    
    context 'emailカラム' do
      let(:test_user) { user }
      let(:test_user_2) { build(:user) }
      it "メールがない場合無効である" do
        test_user.email =  ""
        is_expected.to eq false;
      end
      it "nilの場合無効である" do
        test_user.email =  nil
        is_expected.to eq false;
      end
      it "重複したメールの場合無効である" do
        test_user.email = 'test@test.co.jp'
        test_user.save
        test_user_2.email = 'test@test.co.jp'
        test_user_2.save
        expect(test_user_2).to be_invalid
      end
      it "英数字以外が含まれていないこと" do
        test_user.email = 'テスト@co.jp'
        is_expected.to eq false;
      end
      it "@が含まれていない場合無効である" do
        test_user.email = 'user_at_foo.org'
        is_expected.to eq false;
      end
    end
      
    context 'introductionカラム' do
      let(:test_user) { user }
      it "プロフィールが150字以下であること" do
        test_user.introduction = Faker::Lorem.characters(151)
        is_expected.to eq false;
      end
      it "プロフィールにNGWORDが含まれていないこと" do
        expect(page).not_to have_content'@'
      end
    end
    
    context 'passwordカラム' do
      let(:test_user) { user }
      it "passwordがない場合無効である" do
        test_user.password = ""
        is_expected.to eq false;
      end
      it "passwordがnilの場合無効である" do
        test_user.password = nil
        is_expected.to eq false;
      end
      it 'パスワードが6文字以上でない場合無効である' do
        test_user.password = Faker::Internet.password(min_length: 5, max_length: 5)
        is_expected.to eq false;
      end  
      it 'パスワードが6文字以上なら有効である' do
        test_user.password = Faker::Internet.password(6)
        is_expected.to eq false;
      end
    end  
  end  
  
  describe 'アソシエーションのテスト' do 
    context 'Gymモデルとの関係' do
      it '1:Nになっている' do
        expect(User.reflect_on_association(:gyms).macro).to eq :has_many
      end
      
    end
  end
end
