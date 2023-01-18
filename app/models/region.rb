class Region < ApplicationRecord
  has_many :client_regions
  has_many :clients, through: :client_regions
  has_many :locations
  has_many :hotel_branches
  validates :name, presence: true
end