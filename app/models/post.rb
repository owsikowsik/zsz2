class Post < ActiveRecord::Base

        
    	has_attached_file :img,
					   :styles => {:medium => "400x400>", :thumb => "100x100>" }
	has_attached_file :file


	validates_attachment_content_type :img, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"],
										:message => '--- akceptuje tylko pliki PNG GIF i JPG ---'

		validates_attachment_size :img,	
								:in	=> 0..3050.kilobytes,
								:message => '--- za duży plik, max rozmiar to 3050 kB ---'	

	do_not_validate_attachment_file_type :file


	scope :sort, lambda{order("posts.position DESC")}
	scope :newest, lambda{order("posts.created_at DESC")}
end
