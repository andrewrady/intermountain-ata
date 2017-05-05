class AddStatusToRing < ActiveRecord::Migration
  def change
    add_column :rings, :status, :boolean
  end
end
