require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end

  describe 'チャット投稿' do
    context '投稿できるとき' do
      it '項目があれば投稿できる' do
        expect(@chat).to be_valid
      end
    end
  

  context '投稿できない時' do
    it '文章がないと投稿できない' do
      @chat.sentence = ''
      @chat.valid?
    end
   end
  end
end
