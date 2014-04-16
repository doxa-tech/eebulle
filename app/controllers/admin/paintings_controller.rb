class Admin::PaintingsController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }
	before_filter :find_gallery

  def new
  	@painting = Painting.new
  end

  def create
  	@painting = @gallery.paintings.new(painting_params)
    if @painting.save
    else
      render 'new'
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
