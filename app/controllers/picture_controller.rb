class PictureController < ApplicationController
before_action :load_imagable

#picture craete for event and user profile picture
def create
	@picture =@imageable.pictures.new(picture_params)  
	if @picture.save
	    redirect_to [@imageable, :pictures], notice: 'Comment created'
	else
		render :new
	end
	end 

#render picture from
	def new
		@picture  = @imageable.pictures.new
	end

#show picture
	def show
		@picture = Picture.find(params[:id])
	    @imageable = User.find(params[:user_id])
	    @imageable = Event.find(params[:event_id])
	end
	
#private method for picture params and load images
	private
	def picture_params
	    params.require(:picture).permit(:picture)
	end
	def load_imagable
	    resource, id = request.path.split('/')[1,2]
	    @imagable = resource.singularize.classify.constantize.find(id)
	end
end


