class Day < ApplicationRecord
	has_many :day_activities
	has_many :activities, through: :day_activities
end
