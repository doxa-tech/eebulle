class MessagesController < ApplicationController
	before_action { |c| c.authenticate(:messages) }

	def index
		@preachings = Message.preaching.where('date >= ?', 1.month.ago).order('date DESC')
    		@homegroups = Message.homegroup.where('date >= ?', 1.month.ago).order('date DESC')
    		@teachings  = Message.teaching.all
	end

end
