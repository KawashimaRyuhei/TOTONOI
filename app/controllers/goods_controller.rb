class GoodsController < ApplicationController
  def create
    @store = Store.find(params[:store_id])
    good = current_user.goods.build(store_id: params[:store_id])
    good.save
  end

  def destroy
    @store = Store.find(params[:id])
    good = Good.find_by(store_id: params[:id], user_id: current_user.id)
    good.destroy
  end
end
