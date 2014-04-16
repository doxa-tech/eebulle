class MessagesController < ApplicationController
	before_action { |c| c.authorize_level(4) }

	def index
		@messages = Message.all
	end
end
