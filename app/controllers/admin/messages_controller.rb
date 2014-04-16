class Admin::MessagesController < Admin::BaseController
	before_action { |c| c.authorize_level(3) }

	def index
		@table = MessageTable.new(view_context)
		respond_to do |format|
			format.html
			format.js { render 'sort' }
		end
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to admin_messages_path, success: t('message.admin.new.success')
		else
			render 'new'
		end
	end

	def edit
		@message = Message.find(params[:id])
	end

	def update
		@message = Message.find(params[:id])
		if @message.update_attributes(message_params)
			redirect_to admin_messages_path, success: t('message.admin.edit.success')
		else
			render 'edit'
		end
	end

	def destroy
		Message.find(params[:id]).destroy
		redirect_to admin_messages_path, success: t('message.admin.destroy.success')
	end

	private

	def message_params
		params.require(:message).permit(:name, :file, :speaker, :date)
	end
end
