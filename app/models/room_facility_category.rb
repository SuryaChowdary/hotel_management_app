class RoomFacilityCategory < ApplicationRecord
  has_many :room_facilities
  has_many :rooms, through: :room_facilities
  validates :name, presence: true
end