class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|

    	t.string "name", :limit=>20
    	t.string "surname", :limit=>40
    	t.string "user", :limit=>40
    	t.string "email", :limit=>80, :default=>"", :null=>false
    	t.string "password_digest"

      t.timestamps
    end

    add_index("users", "user")
  end

	def down
		drop_table :users

 end
end
