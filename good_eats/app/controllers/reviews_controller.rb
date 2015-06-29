class ReviewsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end


  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)

    if @review.save
      flash[:notice] = "Success!"
      redirect_to @restaurant
    else
      flash[:notice] = "There was an Error."
      redirect_to @restaurant
    end
  end



  private
    def review_params
      params.require(:review).permit(:rating, :body)
    end
end
