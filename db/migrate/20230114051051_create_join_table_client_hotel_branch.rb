class CreateJoinTableClientHotelBranch < ActiveRecord::Migration[7.0]
  def change
    create_join_table :clients, :hotel_branches do |t|
      # t.index [:client_id, :hotel_branch_id]
      # t.index [:hotel_branch_id, :client_id]
    end
  end
end
