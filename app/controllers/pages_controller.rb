class PagesController < ApplicationController
	before_action :require_login, only: [:profile]
	layout 'admin', only: :profile

	def home
		@page = Page.find_by_name('home')
		@event = Event.where("date + (duration - 1)  * INTERVAL '1 day'  >= ?", [Time.zone.now]).order('date ASC').first
		@activities = Activity.where(main: true)
	end

	def presentation
		@page = Page.find_by_name('presentation')
	end

	def contact
		@page = Page.find_by_name('contact')
	end

	def kidsbulle
		@page = Page.find_by_name('kidsbulle')
	end
	
	def shiloa
		@page = Page.find_by_name('shiloa')
	end

	def romont
		@page = Page.find_by_name('romont')
	end

	def vision
		@page = Page.find_by_name('vision')
	end

	def financement
		@page = Page.find_by_name('financement')
	end

	def a
		@page = Page.find_by_name('a')
	end

	def agenda
		@page = Page.find_by_name('agenda')
		render layout: 'agenda'
	end

	def profile
	end
end
