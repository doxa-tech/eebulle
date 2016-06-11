class Admin::MessagesController < Admin::BaseController
	before_action { |c| c.authorize_level(3) }

	def index
		@table = Table.new(self, Message)
		@table.respond
	end

	def new
		@message = Message.new
	end


	def create
		@element = Message.new(message_params)
    if @element.save
    	render 'success'
    else
      render 'error'
    end
	end

	def edit
		@message = Message.find(params[:id])
	end

	def update
		@element = Message.find(params[:id])
		if @element.update_attributes(message_params)
			render 'success'
		else
			render 'error'
		end
	end

	def destroy
		Message.find(params[:id]).destroy
		redirect_to admin_messages_path, success: t('message.admin.destroy.success')
	end

	private

	def message_params
		params.require(:message).permit(:name, :file, :speaker, :date, :category)
	end
end
