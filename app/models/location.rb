class Location < ApplicationRecord
  belongs_to :region
  has_many :client_locations
  has_many :clients, through: :client_locations
  has_many :hotel_branches
  validates :name, presence: true
end