class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.order("serial ASC")
    @all = Video.all       
    @rated = Video.left_outer_joins(:ratings).where( ratings: { user_id: current_user })        
    @leftover = @all - @rated
    @random = @leftover.sample
    #plucks random sample from remaining videos
    
  end

  # GET /videos/1
  # GET /videos/1.json
  def show        
    @all = Video.all       
    @rated = Video.left_outer_joins(:ratings).where( ratings: { user_id: current_user })        
    @leftover = @all - @rated


    @random = @leftover.sample
    #plucks random sample from remaining videos


  
    if current_user.has_rating?(@video)
      @rating = Rating.find_by(user_id: current_user, video_id: @video)  
    else
      @rating = Rating.new( :video => @video)
    end
    @rated = Rating.find_by(user_id: current_user, video_id: @video)  

    @vr = @video.ratings.group(:cue).count    
    @vc = @video.ratings.group(:level).count    
    
  end  

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :description, :category_id, :youtube_id, :serial)
    end

end
