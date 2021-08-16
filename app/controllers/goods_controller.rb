class GoodsController < ApplicationController
  def create
    good = current_user.goods.build(store_id: params[:store_id])
    good.save
    redirect_to stores_path
  end

  def destroy
    good = Good.find_by(store_id: params[:id], user_id: current_user.id)
    good.destroy
    redirect_to stores_path
  end
end
