require 'rails_helper'

RSpec.describe Gym, type: :model do
    describe 'バリデーションのテスト' do
        let(:gym){build(:gym)}
        subject {test_gym.valid?}
        context 'nameカラム' do
            let(:test_gym){ gym }
            let(:test_gym_2) { build(:gym) }
            it '空欄でないこと' do
                test_gym.name = ""
                is_expected.to eq false;
            end
            it 'nilでないこと' do
                test_gym.name = nil
                is_expected.to eq false;
            end
            it '3字以上であること' do
                test_gym.name = Faker::Lorem.characters(number:1)
                is_expected.to eq false;
            end
            it '30字以下であること' do
                test_gym.name = Faker::Lorem.characters(number:31)
                is_expected.to eq false;
            end
            it '登録済のジム名称と重複していないこと' do
                test_gym.name = "hoge"
                test_gym.save
                test_gym_2.name = "hoge"
                test_gym_2.save
                expect(test_gym_2).to be_invalid
            end
            it 'NGWORDが入っていないこと' do
                test_gym.name = "hoge"
                # includeかな？
            end
        
        context 'postcodeカラム' do
            let(:test_gym) { gym }
            let(:test_gym_2) { build(:gym) }
            it '数字とハイフンのみであること' do
                test_gym.postcode = 'test'
                is_expected.to eq false;
            end
        end
        
        context 'address' do
            let(:test_gym) { gym }
            let(:test_gym_2) { build(:gym) }
            it '登録済の住所と重複した場合無効' do
                test_gym.address = "東京都千代田区千代田１−１"
                test_gym.save
                test_gym_2.address = "東京都千代田区千代田１−2"
                test_gym_2.save
                expect(test_gym_2).to be_invalid
            end
        end
        
        context 'introduction' do
            let(:test_gym) { gym }
            it '140字以下であること' do
                test_gym.introduction = Faker::Lorem.characters(141)
                is_expected.to eq false;
            end
            it 'NGWORDエラーが出るか'
            it 'NGWORDがなければ投稿できるか'
        end
        
        context 'tel' do
            it '登録済の電話番号と重複しないこと'
            it 'VALID_PHONE_NUMBER_REGEXのみで入力されていること'
        end
        
        context 'url' do
            it '登録済のURLと重複しないこと'
            it 'NGWORDが入っていないこと'
        end
        
        context 'open_time' do
            it '50字以下であること'
            it 'NGWORDが入っていないこと'
        end
        context 'price' do
            it '50字以下であること'
            it 'NGWORDが入っていないこと'
        end
        
        context 'holiday' do
            it '70字以下であること'
            it 'NGWORDが入っていないこと'
        end
        
        context 'access' do
            it '100字以下であること'
            it 'NGWORDが入っていないこと'
        end
    end
    end
end
end