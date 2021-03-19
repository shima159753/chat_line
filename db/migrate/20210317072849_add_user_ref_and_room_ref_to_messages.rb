class AddUserRefAndRoomRefToMessages < ActiveRecord::Migration[6.0]
  def change
    #remove_reference :messages, :user, foreign_key: true
    #remove_reference :messages, :room, foreign_key: true
  end
end
