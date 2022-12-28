class CreateLocation < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.references :region, foreign_key: true
      t.string :country
      t.timestamps
    end
  end
end
