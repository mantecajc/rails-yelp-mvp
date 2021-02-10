class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # Now we need to find the restaurant that it belows this review
    @restaurant = Restaurant.find(params[:restaurant_id])
    # Now we need to add this id to review#restaurant_id
    @review.restaurant_id = @restaurant.id
    # @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
