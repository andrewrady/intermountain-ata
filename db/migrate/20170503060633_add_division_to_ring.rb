class AddDivisionToRing < ActiveRecord::Migration[4.2]
  def change
    add_column :rings, :division, :string
  end
end
