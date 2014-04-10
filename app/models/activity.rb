class Activity < ActiveRecord::Base
	has_many :day_activites
	has_many :days, through: :day_activites
	has_many :recurrence_activities
	has_many :recurrences, through: :recurrence_activities
end
