class Room < ApplicationRecord
  belongs_to :hotel_branch
  has_many :room_facilities
  has_many :room_facility_categories, through: :room_facilities
  validates :name, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

