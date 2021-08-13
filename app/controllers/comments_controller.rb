class CommentsController < ApplicationController
  def create
    @store = Store.find(params[:store_id])
    binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to store_path(@store)
    else
      @comments = @store.comments.includes(:user)
      render "stores#show"
    end
  end




  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, store_id: params[:store_id])
  end

end
