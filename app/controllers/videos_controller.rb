class VideosController < ApplicationController
  before_action :set_user,           only: [:index, :new, :show, :edit]
  before_action :set_video,          only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def index
    @videos = Video.all.page(params[:page]).per(20)
  end

  def new
    if user_signed_in?
      @video = Video.new
    else
      flash[:before_new] = true
      redirect_to new_user_session_url
    end
  end
  
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    
    url = params[:video][:youtube_url]
    url = url.last(11)
    @video.youtube_url = url
    
    
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: '動画を投稿しました' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end
  
  def search
    if params[:title].present?
      @videos = Video.where('title LIKE ?', "%#{params[:title]}%").page(params[:page]).per(20)
      render :show_search
    elsif params[:tag].present?
      @videos = Video.tagged_with(params[:tag], :wild => true, :any => true).page(params[:page]).per(20)
      render :show_search
    else
      @videos = Video.all.page(params[:page]).per(20)
      render :index
    end
  end
  
  def show_search
    @videos
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: '動画が編集されました' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: '動画が削除されました' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(current_user.id) if user_signed_in?
    end
  
    def set_video
      @video = Video.find(params[:id]) unless params[:id] == "search"
    end

    def video_params
      params.require(:video).permit(:title, :youtube_url, :tag_list)
    end
end
