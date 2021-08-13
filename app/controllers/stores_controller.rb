class StoresController < ApplicationController
  def index
    @store = Store.includes(:user)
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
    @store = Store.find(params[:id])
    @comments = @store.comments.includes(:user)
  end

  def edit
    @store = Store.find(params[:id]) 
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(post_params)
      redirect_to store_path(@store)
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:store).permit(:name, :address, :postal_code, :telephone, :url, :closing_day, :business_hour, :fee, :water, :temperature, :roryu_status, :roryu_time, :air_bath, :break_place, :television, :bgm, :image).merge(user_id: current_user.id)
  end
end