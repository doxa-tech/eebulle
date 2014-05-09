class EventsController < ApplicationController

	def index
		@events = Event.where("date >= ?", Date.today ).order("date ASC")
	end
end
