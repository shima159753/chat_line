require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム作成' do
    context '作成できるとき' do
      it '名前があれば投稿できる' do
        expect(@room).to be_valid
      end
    end
  

  context '作成できない時' do
    it '名前がないと投稿できない' do
      @room.name = ''
      @room.valid?
    end
   end
  end
end
