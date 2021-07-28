class FeedbackController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    FeedbackMailer.create(params[:email], params[:title], params[:text]).deliver_now
    flash.now[:notice] = t('.success')
    render :index
  end

end