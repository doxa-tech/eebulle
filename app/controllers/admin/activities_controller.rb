class Admin::ActivitiesController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = ActivityTable.new(view_context)
		respond_to do |format|
			format.html
			format.js { render 'sort' }
		end
	end

	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)
		if @activity.save
			redirect_to admin_activities_path, success: t('activity.admin.new.success')
		else
			render 'new'
		end
	end

	def edit
		@activity = Activity.find(params[:id])
	end

	def update
		@activity = Activity.find(params[:id])
		if @activity.update_attributes(activity_params)
			redirect_to admin_activities_path, success: t('activity.admin.edit.success')
		else
			render 'edit'
		end
	end

	def destroy
		Activity.find(params[:id]).destroy
		redirect_to admin_activities_path, success: t('activity.admin.destroy.success')
	end

	private

	def activity_params
		params.require(:activity).permit(:name, :content, :time, :recurrence_id, { day_ids: [] }, :main)
	end
end
