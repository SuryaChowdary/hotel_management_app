class HotelBranch < ApplicationRecord
  has_many :rooms
  belongs_to :location
  belongs_to :client
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :phone, presence: true
  validates :website, presence: true
  accepts_nested_attributes_for :rooms

end