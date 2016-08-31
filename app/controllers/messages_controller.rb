class MessagesController < ApplicationController
	before_action { |c| c.authenticate("messages") }

	def index
		@preachings = Message.preaching.where('date >= ?', 1.month.ago).order('date DESC')
    @homegroups = Message.homegroup.where('date >= ?', 1.month.ago).order('date DESC')
	end

  def download
    message = Message.find(params[:id])
    send_file File.join(Rails.root, "public", message.file_url), type: "audio/mpeg"
  end
end
