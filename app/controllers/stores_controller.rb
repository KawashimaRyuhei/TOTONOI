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
  end

  private
  def post_params
    params.require(:store).permit(:name, :address, :postal_code, :telephone, :url, :closing_day, :business_hour, :fee, :water, :temperature, :television, :bgm, :image).merge(user_id: current_user.id)
  end
end