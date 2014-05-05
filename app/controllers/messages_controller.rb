class MessagesController < ApplicationController
	before_action { |c| c.authorize_level(4) }

	def index
		@messages = Message.where('date >= ?', 2.month.ago).order('date DESC')
	end
end
