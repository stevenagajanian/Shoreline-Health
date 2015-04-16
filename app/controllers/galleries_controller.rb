class GalleriesController < InheritedResources::Base
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save

        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @gallery.photos.create(image: image)
            }
        end

        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

  def gallery_params
    params.require(:gallery).permit(:user_id, :name, :description, :doctor_visit_id, :post_id, :symptom_id, :lab_result)
  end
end
