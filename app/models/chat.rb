class Chat < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search != ""
      User.where('nickname LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end

  validates :sentence, presence: true
end
