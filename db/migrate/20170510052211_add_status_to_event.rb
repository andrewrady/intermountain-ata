class AddStatusToEvent < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :status, :boolean
  end
end
