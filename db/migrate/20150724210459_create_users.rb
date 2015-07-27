class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.column "First_name", :string, :limit => 25
	  t.column "password", :string, :limit => 40
	  t.column "email", :string, :default => "", :null => false
      t.timestamps null: false
    end
  end
  
  def down
     drop_table :users
  end
end
