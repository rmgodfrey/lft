class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(user: current_user)
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @review.user = current_user
    @review.offer = Offer.find(params[:offer_id])
    @review.save
    redirect_to offer_path(@review.offer)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
