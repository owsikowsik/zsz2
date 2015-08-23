class User < ActiveRecord::Base
    	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates   :name,
				:presence => {:in => true, :message => "pole nie może być puste"}

	validates   :surname,
				:presence => true

	validates   :user,
				:length => {:within => 4..40, :message => "Login za krótki, bądź za długi"},
				:uniqueness => true

	validates :email,
			  :presence => true,
			  :length => {:maximum => 80},
			  :format => {:with => EMAIL_REGEX, :message => "niepoprawny format"},
			  :confirmation => true

	scope :sortuj, lambda{order("surname ASC, name ASC")}
end
