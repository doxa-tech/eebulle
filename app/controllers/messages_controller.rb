class MessagesController < ApplicationController
	before_action { |c| c.authenticate(:messages) }

	def index
		@vips = Message.vip.order(name: :asc)
		@preachings = Message.preaching.where('date >= ?', 1.month.ago).order(date: :desc)
		@homegroups = Message.homegroup.where('date >= ?', 1.month.ago).order(date: :desc)
		@teachings  = Message.teaching.order(name: :asc)
		@bible_studies = Message.bible_study.order(name: :asc)
	end

end
