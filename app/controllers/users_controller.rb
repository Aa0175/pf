class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]

  def index
  end

  def show
    @videos = Video.all.where(user_id: current_user.id).page(params[:page]).per(20)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      if User.exists?(id: params[:id])
        @user = User.find(params[:id])
        correct_user
      else
        redirect_to root_path
      end
    end
    
    def correct_user
      redirect_to root_path unless @user && current_user == @user
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
