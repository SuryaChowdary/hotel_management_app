class Region < ApplicationRecord
  belongs_to :client , optional: true
  has_many :locations , dependent: :destroy
  has_many :hotel_branches, through: :locations
  validates :name, presence: true
end