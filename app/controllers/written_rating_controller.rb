class WrittenRatingController < ApplicationController
  def edit
  end

  def update
  	wrating = WrittenRating.find(params[:id])
  	if wrating
  		wrating.update!(rating_params)
  	end
  	redirect_to :back
  end

  def new
  end

  private
  	def rating_params
  		params.require(:written_rating).permit(:rating, :comment)
  	end
end
