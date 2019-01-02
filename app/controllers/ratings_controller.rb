class RatingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_video, only: [:update]

  def index
      @ratings = Rating.all
  end
  
  def new
    @video = Video.find(params[:id])    
  end
  
  def edit
    @video = Video.find(params[:video_id])  
  end

  def create
    @rating = Rating.new(rating_params)
    respond_to do |format|
      if @rating.save
        format.html { 
          if @rating.video.next
          redirect_to @rating.video.next, notice: 'Rating was saved.' 
          else 
            redirect_to videos_path, notice: 'Thank you, all done.' 
          end
        }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render @rating.video }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @rating = Rating.find_by(user_id: current_user, video_id: @video)      
    if @rating.update_attributes(rating_params)
      redirect_to video_path(@video), :notice => "Rating updated."
    else
      redirect_to video_path(@video), :alert => "Unable to update user."
    end
  end
  
  def update
    @video = @rating.video_id
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to video_path(@video), notice: 'Rating was successfully updated.' }
      else
        format.html { redirect_to video_path(@video), alert: 'Rating was not updated.' }
      end
    end
  end
  
  def destroy
    @rating = Rating.find(params[:id])
    if @rating.destroy
      redirect_to ratings_path, notice: 'Rating Deleted.' 
    else
      render json: { errors: { comment: ['error'] } }, status: :forbidden
    end
  end
  

  private
  
  def set_video
    @rating = Rating.find(params[:id])
    @video = @rating.video.id
  end
  
  def rating_params
     params.require(:rating).permit(:video_id, :user_id, :cue, :level)
  end
  
end