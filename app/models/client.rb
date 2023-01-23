class Client < ApplicationRecord
  has_many :client_regions
  has_many :regions, through: :client_regions
  has_many :client_locations
  has_many :locations, through: :client_locations
  has_many :hotel_branches
  validates :name, presence: true
  belongs_to :user
  accepts_nested_attributes_for :hotel_branches
  validate :check_region_and_location

  private

  # private method to ensure the client has regions and locations assocaited or not
  def check_region_and_location
    if self.region_ids.blank?
      errors.add(:region_ids, "Please select at least one region")
    end
    if self.location_ids.blank?
      errors.add(:location_ids, "Please select at least one location")
    end
  end
  
end