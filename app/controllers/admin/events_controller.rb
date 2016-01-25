class Admin::EventsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Event)
		@table.respond
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to admin_events_path, success: t('event.admin.new.success')
		else
			render 'new'
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			redirect_to admin_events_path, success: t('event.admin.edit.success')
		else
			render 'edit'
		end
	end

	def destroy
		Event.find(params[:id]).destroy
		redirect_to admin_events_path, success: t('event.admin.destroy.success')
	end

	private

	def event_params
		params.require(:event).permit(:content, :name, :duration, :date, :image, :category)
	end

end
