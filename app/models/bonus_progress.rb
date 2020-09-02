class BonusProgress < ApplicationRecord
  belongs_to :bonuse
  belongs_to :bet
  belongs_to :user
  belongs_to :tournament
end
