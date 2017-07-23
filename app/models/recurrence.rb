class Recurrence < ApplicationRecord
	has_many :recurrence_activities
	has_many :activities, through: :recurrence_activities
end
