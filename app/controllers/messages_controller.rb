class MessagesController < ApplicationController
	before_action { |c| c.authorize_level(5) }

	def index
		@preachings = Message.preaching.where('date >= ?', 1.month.ago).order('date DESC')
    @homegroups = Message.homegroup.where('date >= ?', 1.month.ago).order('date DESC')
	end
end
