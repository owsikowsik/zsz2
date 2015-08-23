class CreateSliders < ActiveRecord::Migration

  def up
    create_table :sliders do |t|

      t.string "name"
    	t.integer "position"
    	t.attachment :img

      t.timestamps
    end

  end
   def down
    drop_table :sliders

  end
end