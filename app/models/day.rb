class Day < ActiveRecord::Base
	has_many :day_activities
	has_many :activities, through: :day_activities
end
