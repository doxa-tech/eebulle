class PagesController < ApplicationController
	before_action :require_login, only: [:profile]
	layout 'admin', only: :profile

	def home
		@page = Page.find_by_name('home')
		@page_youtube = Page.find_by_name('home_youtube')
		@event = Event.where("date + (duration - 1)  * INTERVAL '1 day'  >= ?", [Time.zone.now]).order('date ASC').first
		@activities = Activity.where(main: true).includes(:recurrence, :days)
	end

	def presentation
		@page = Page.find_by_name('presentation')
	end

	def contact
		@page = Page.find_by_name('contact')
	end

	def vision
		@page = Page.find_by_name('vision')
	end

	def financement
		@page = Page.find_by_name('financement')
	end

	def verdel8
		@page = Page.find_by_name('verdel8')
	end

	def profile
	end

	def logins
	end
end
