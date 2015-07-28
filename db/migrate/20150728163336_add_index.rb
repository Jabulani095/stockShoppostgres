class AddIndex < ActiveRecord::Migration
  def change
  add_index("events_ids", "userId")
  add_index("events_ids", "eventId")
  end
end
