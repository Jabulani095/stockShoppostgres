class CreateDevises < ActiveRecord::Migration
  def change
    create_table :devises do |t|
      t.column "userId", :string, :limit => 80
	  t.column "email", :string, :limit => 80
	  t.column "password", :string, :limit =>80
      t.timestamps null: false
    end
  end
end
