class Calendar < ActiveRecord::Base

       
        	validates :date1,
				:presence => true

				
    		validates :date2,
				:presence => true

	scope :sort, lambda{order("calendars.position DESC")}
    
end
