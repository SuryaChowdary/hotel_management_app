class CreateRoom < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :hotel_branch, foreign_key: true
      t.string :name
      t.integer :capacity
      t.integer :price
      t.timestamps
    end
  end
end
