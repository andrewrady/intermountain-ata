class AddStatusToRing < ActiveRecord::Migration[4.2]
  def change
    add_column :rings, :status, :boolean
  end
end
