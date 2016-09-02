class CreateRings < ActiveRecord::Migration
  def change
    create_table :rings do |t|
        t. integer  :ring_number
        t.string    :ring_rank
        t.string    :ring_age
        t.string    :ring_gender
      t.timestamps null: false
    end
  end
end
