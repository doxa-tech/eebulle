class Activity < ActiveRecord::Base
	has_many :day_activities
	has_many :days, through: :day_activities
	belongs_to :recurrence
end
