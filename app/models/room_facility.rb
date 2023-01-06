class RoomFacility < ApplicationRecord
  belongs_to :room
  belongs_to :room_facility_category
  validates :name, presence: true
end