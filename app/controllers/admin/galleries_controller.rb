class Admin::GalleriesController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Gallery)
    @table.respond
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to edit_admin_gallery_path(@gallery), success: t('gallery.admin.new.success')
    else
      render 'new' 
    end
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(gallery_params)
      redirect_to edit_admin_gallery_path(@gallery), success: t('gallery.admin.edit.success')
    else
      render 'edit'
    end
	end

	def destroy
		@gallery = Gallery.find(params[:id])
    # remove the gallery's pictures
    @gallery.paintings.each do |painting|
      painting.remove_image!
      painting.destroy
    end
    @gallery.destroy
    redirect_to admin_galleries_path, success: t('gallery.admin.destroy.success')
	end

	private

	def gallery_params
		params.require(:gallery).permit(:name, :description, :date)
	end
end
