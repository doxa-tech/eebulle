class Admin::DownloadsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Download)
		@table.respond
	end

	def new
		@download = Download.new
	end

	def create
		@element = Download.new(download_params)
		if @element.save
			render 'success'
		else
			render 'error'
		end
	end

	def edit
		@download = Download.find(params[:id])
	end

	def update
		@element = Download.find(params[:id])
		if @element.update_attributes(download_params)
			render 'success'
		else
			render 'error'
		end
	end

	def destroy
		Download.find(params[:id]).destroy
		redirect_to admin_downloads_path, success: t('download.admin.destroy.success')
	end

	private

	def download_params
		params.require(:download).permit(:name, :file)
	end

end
