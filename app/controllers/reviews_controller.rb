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
    @review.user = current_user
    @offer = Offer.find(params[:offer_id])
    @review.offer = @offer
    if @review.save
      redirect_to offer_path(@review.offer)
    else
      render "reviews/new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
