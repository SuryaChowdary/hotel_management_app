class RemoveClientIdFromRegions < ActiveRecord::Migration[7.0]
  def change
    remove_column :regions , :client_id , :int
  end
end
