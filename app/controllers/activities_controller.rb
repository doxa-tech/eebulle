class ActivitiesController < ApplicationController

	def index
		@activities = Activity.includes(:recurrence, :days)
	end


end
