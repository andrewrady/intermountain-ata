class CreateEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :date
      t.string :location

      t.timestamps null: false
    end
  end
end
