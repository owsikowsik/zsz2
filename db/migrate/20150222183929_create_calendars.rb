class CreateCalendars < ActiveRecord::Migration

  def up
    create_table :calendars do |t|

      t.string "name"
      t.string "place"
      t.string "info"
    	t.string "date1"
      t.string "date2"
    	t.integer "position"

      t.timestamps
    end


  end
   def down
    drop_table :calendars

end
end
