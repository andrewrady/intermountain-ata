class AddAttachmentScheduleToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :schedule
    end
  end

  def self.down
    remove_attachment :events, :schedule
  end
end
