class Admin::PaintingsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }
	before_action :find_gallery

  def new
  	@painting = Painting.new
  end

  def create
  	@painting = @gallery.paintings.new(painting_params)
    unless @painting.save
      render nothing: true, status: 415
    end
  end

  def destroy
  	@painting = Painting.find(params[:id])
    @painting.remove_image!
    @painting.destroy
    redirect_to edit_admin_gallery_path(@gallery), success: t('painting.admin.destroy.success')
  end

  private

  def find_gallery
  	@gallery = Gallery.find(params[:gallery_id])
  end

  def painting_params
  	params.require(:painting).permit(:gallery_id, :image)
  end
end
