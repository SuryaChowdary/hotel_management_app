class Location < ApplicationRecord
  belongs_to :region
  has_many :hotel_branches
  validates :country, presence: true
end