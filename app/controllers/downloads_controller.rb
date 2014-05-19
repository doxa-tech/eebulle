class DownloadsController < ApplicationController

	def index
		@downloads = Download.order(:name)
	end

end
