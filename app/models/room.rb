class Room < ApplicationRecord

  belongs_to :hotel_branch

  validates :name, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

