class Room < ApplicationRecord
  self.inheritance_column = :room_type
  belongs_to :hotel_branch

  validates :name, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

class StandardRoom < Room
end

class DeluxeRoom < Room
end

class SuiteRoom < Room
end
