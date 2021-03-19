class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats,dependent: :destroy
  has_many :messages,dependent: :destroy
  has_many :rooms,dependent: :destroy
  validates :nickname, presence: true, length: { maximum: 10 }

  def self.search(search)
    if search != ""
      User.where('nickname LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end

end
