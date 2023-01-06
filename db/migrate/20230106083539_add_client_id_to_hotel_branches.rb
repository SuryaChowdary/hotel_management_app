class AddClientIdToHotelBranches < ActiveRecord::Migration[7.0]
  def change
    add_column :hotel_branches, :client_id, :int
  end
end
