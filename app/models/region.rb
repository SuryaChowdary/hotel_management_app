class Region < ApplicationRecord
  belongs_to :client
  has_many :locations
  has_many :hotel_branches, through: :locations
  validates :name, presence: true
end