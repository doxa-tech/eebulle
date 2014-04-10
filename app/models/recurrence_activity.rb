class RecurrenceActivity < ActiveRecord::Base
  belongs_to :recurrence
  belongs_to :activity
end
