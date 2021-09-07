class InquiryController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params, only: [:confirm, :thanks]
  
  def index
    @inquiry = Inquiry.new
    render :index
  end

  def confirm
    if @inquiry.valid?
      render :confirm
    else
      render :index
    end
  end

  def thanks
    InquiryMailer.received_email(@inquiry).deliver
    render :thanks
  end

  private

  def find_params
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
  end
end
