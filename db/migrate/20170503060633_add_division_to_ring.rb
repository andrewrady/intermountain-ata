class AddDivisionToRing < ActiveRecord::Migration
  def change
    add_column :rings, :division, :string
  end
end
