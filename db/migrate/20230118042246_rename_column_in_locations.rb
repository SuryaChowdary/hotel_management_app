class RemoveColumnNameInLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations , :country , :name
  end
end
