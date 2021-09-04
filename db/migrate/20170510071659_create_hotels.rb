class CreateHotels < ActiveRecord::Migration[4.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :dates
      t.float :cost
      t.string :link
      t.string :number
      t.string :address
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
