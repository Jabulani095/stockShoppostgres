class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.column "name", :string, :limit => 80
	  t.column "Location", :string, :limit => 80
	  t.column "Date", :date
      t.timestamps null: false
    end
  end
  
  def down
     drop_table :events
  end
end
