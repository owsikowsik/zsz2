class CreatePhotos < ActiveRecord::Migration

  def up
    create_table :photos do |t|

    	t.integer "gallery_id"
    	t.string "name"
    	t.integer "position"
    	t.attachment :img

      t.timestamps
    end
  end
   def down
    drop_table :photos
  end
end