require 'rails_helper'

RSpec.describe Gym, type: :model do
    describe 'バリデーションのテスト'
        context 'nameカラム' do
            it '空欄でないこと'
            it '3文字以上30字以下であること'
            it '登録済のジム名称と重複していないこと'
            it 'NGWORDが入っていないこと'
        end
        
        context 'postcodeカラム'
            it '数字とハイフンのみであること'
        end
        
        context 'address' do
            it '登録済の住所と重複しないこと'
            it 'NGWORDが入っていないこと'
        end
        
        context 'introduction' do
            it '140字以下であること' do
            it 'NGWORDが入っていないこと'
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