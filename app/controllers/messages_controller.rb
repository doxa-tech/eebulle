class MessagesController < ApplicationController
	before_action { |c| c.authorize_level(5) }

	def index
		@messages = Message.where('date >= ?', 1.month.ago).order('date DESC')
	end
end
