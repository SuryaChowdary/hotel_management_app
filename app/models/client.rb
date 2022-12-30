class Client < ApplicationRecord
  has_many :regions
  has_many :locations, through: :regions
  has_many :hotel_branches, through: :locations
  belongs_to :user
  validates :name, presence: true
end