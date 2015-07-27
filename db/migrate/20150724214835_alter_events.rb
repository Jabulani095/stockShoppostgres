class AlterEvents < ActiveRecord::Migration
  def up
  change_column("events","Date", :datetime)
  puts "****adding the index is next"
  add_index("events","name")
  end
  
  def down
  remove_index("events","name")
  change_column("events","Date", :date)
  
  end
end
