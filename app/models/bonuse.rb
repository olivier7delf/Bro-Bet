class Bonuse < ApplicationRecord
  has_many :bonus_progresses
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :probability, presence: true
end
