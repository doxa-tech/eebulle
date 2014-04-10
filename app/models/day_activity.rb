class DayActivity < ActiveRecord::Base
  belongs_to :day
  belongs_to :activity
end
