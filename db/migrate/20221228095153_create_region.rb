class CreateRegion < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.references :client, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
