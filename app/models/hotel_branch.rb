class HotelBranch < ApplicationRecord
  has_many :rooms
  belongs_to :location
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :phone, presence: true
  validates :website, presence: true
end