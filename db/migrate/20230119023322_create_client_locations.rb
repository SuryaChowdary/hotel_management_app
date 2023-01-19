class CreateClientLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :client_locations do |t|
      t.integer :client_id
      t.integer :location_id
      t.timestamps
    end
  end
end
