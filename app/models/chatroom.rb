class Chatroom < ApplicationRecord
  # bet_chatroom GET    /bets/:bet_id/chatrooms/:id(.:format)   chatrooms#show
  has_many :messages
  # belongs_to :bet
end
