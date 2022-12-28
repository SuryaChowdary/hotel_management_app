class CreateRoomFacility < ActiveRecord::Migration[6.1]
  def change
    create_table :room_facilities do |t|
      t.string :name
      t.belongs_to :room, foreign_key: true
      t.belongs_to :room_facility_category, foreign_key: true
      t.timestamps
    end
  end
end
