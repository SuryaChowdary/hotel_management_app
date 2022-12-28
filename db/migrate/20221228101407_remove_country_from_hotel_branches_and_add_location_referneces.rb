class RemoveCountryFromHotelBranchesAndAddLocationReferneces < ActiveRecord::Migration[6.1]
  def change
    remove_column :hotel_branches, :country
    add_reference :hotel_branches, :location, index: true
  end
end
