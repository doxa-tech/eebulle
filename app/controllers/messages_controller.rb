class MessagesController < ApplicationController
	before_action { |c| c.authenticate(:messages) }

	def index
		@preachings = Message.preaching.where('date >= ?', 1.month.ago).order('date DESC')
    @homegroups = Message.homegroup.where('date >= ?', 1.month.ago).order('date DESC')
    @teachings  = Message.teaching.where('date >= ?', 1.month.ago).order('date DESC')
	end

  def show
    message = Message.find(params[:id])
    send_file message.file.url, filename: "EEBulle_#{message.date}_#{message.speaker}_#{message.name}", disposition: 'attachment'
  end
end
