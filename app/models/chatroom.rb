class Chatroom < ApplicationRecord
  belongs_to :bet, optional: true
  belongs_to :tournament, optional: true
  has_many :messages
end
