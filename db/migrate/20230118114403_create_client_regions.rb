class CreateClientRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :client_regions do |t|
      t.integer :client_id
      t.integer :region_id
      t.timestamps
    end
  end
end
