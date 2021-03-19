class Room < ApplicationRecord
  has_many :messages
  validates :name, presence: true, length: { maximum: 10 }
  belongs_to :user

  def self.search(search)
    if search != ""
      Room.where('name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end

end
