class CreateHotelBranch < ActiveRecord::Migration[6.1]
  def change
    create_table :hotel_branches do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :website
      t.timestamps
    end
  end
end
