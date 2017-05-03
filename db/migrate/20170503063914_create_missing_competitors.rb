class CreateMissingCompetitors < ActiveRecord::Migration
  def change
    create_table :missing_competitors do |t|
      t.string :name
      t.references :ring

      t.timestamps null: false
    end
  end
end
