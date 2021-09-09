class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :search_store
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @store = Store.includes(:user).page(params[:page]).per(6)
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(post_params)
    if @store.valid?
      @store.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @store.comments.includes(:user)
  end

  def edit
  end

  def update
    if @store.update(post_params)
      redirect_to store_path(@store)
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to root_path
  end

  def search
    @results = @s.result.page(params[:page]).per(6)
  end

  private
  def move_to_index
    unless current_user.id == 1 || current_user.id == 2
      redirect_to root_path
    end
  end

  def find_params
    @store = Store.find(params[:id])
  end

  def post_params
    params.require(:store).permit(:name, :address, :postal_code, :telephone, :url, :closing_day, :business_hour, :fee, :water, :temperature,
                                  :roryu_status, :roryu_time, :air_bath, :break_place, :television, :bgm, :water_depth, images: []).merge(user_id: current_user.id)
  end
end
