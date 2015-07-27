class CreateEventsIds < ActiveRecord::Migration
  def up
    create_table :events_ids do |t|
      t.column "userId", :int
	  t.column "eventId", :int
      t.timestamps null: false
    end
  end
  
  def down
   drop_table :events_ids
  end
  
end
