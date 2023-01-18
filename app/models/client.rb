class Client < ApplicationRecord
  has_many :client_regions
  has_many :regions, through: :client_regions
  has_many :hotel_branches
  validates :name, presence: true
  belongs_to :user
  accepts_nested_attributes_for :hotel_branches
  accepts_nested_attributes_for :regions
end