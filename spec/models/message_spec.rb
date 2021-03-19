require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context '投稿できるとき' do
      it '項目があれば投稿できる' do
        expect(@message).to be_valid
      end
    end
  
  context '投稿できない時' do
    it '文章がないと投稿できない' do
      @message.content = ''
      @message.valid?
    end
   end
  end
end
