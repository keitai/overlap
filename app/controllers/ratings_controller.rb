class RatingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_video, only: [:create]
  before_action :set_rating, only: [:update]



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
    @all = Video.where.not(id: @video.id)
    @rated = Video.left_outer_joins(:ratings).where( ratings: { user_id: current_user })            
    @leftover = @all - @rated

    @random = @leftover.sample
    #plucks random sample from remaining videos
    
    @rating = Rating.new(rating_params)
      if @rating.save      
          if @random.present?
          redirect_to @random, notice: 'Rating was saved.' 
          else 
            redirect_to videos_path, notice: 'Thank you, all done.' 
          end
      else
        redirect_to @rating.video, :alert => "please rate both cue and level"
      end
  end
  
  def update
    @all = Video.where.not(id: @video)       
    @rated = Video.left_outer_joins(:ratings).where( ratings: { user_id: current_user })        
    
    @leftover = @all - @rated
    @random = @leftover.sample
    #plucks random sample from remaining videos
    
    @rating = Rating.find_by(user_id: current_user, video_id: @video)      
    if @rating.update_attributes(rating_params)
      if @random.present?
        redirect_to @random, :notice => "Rating updated."
      else
        redirect_to videos_path, notice: 'Thank you! You have rated all the videos.'         
      end
    else
      redirect_to video_path(@video), :alert => "Unable to update user."
    end
  end
  
  
  def destroy
    @rating = Rating.find(params[:id])
    if @rating.destroy
      redirect_to video_ratings_path, notice: 'Rating Deleted.' 
    else
      render json: { errors: { comment: ['error'] } }, status: :forbidden
    end
  end
  

  private

  def set_rating
    @rating = Rating.find(params[:id])
    @video = @rating.video.id
  end
  
  def set_video
    @video = Video.find(params[:video_id])
  end
  
  def rating_params
     params.require(:rating).permit(:id, :video_id, :user_id, :cue, :level)
  end
  
end