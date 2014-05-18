class EventsController < ApplicationController

	def index
		@events = Event.where("date + (duration - 1)  * INTERVAL '1 day'  >= ?", [Time.zone.now]).order('date ASC')
	end
end
