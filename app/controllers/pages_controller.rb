class PagesController < ApplicationController

	def home
		@page = Page.find_by_name('home')
		@event = Event.where('date >=?', [Time.zone.now]).order('date ASC').first
		@activities = Activity.where(main: true)
	end

	def presentation
		@page = Page.find_by_name('presentation')
	end

	def contact
		@page = Page.find_by_name('contact')
	end
end
