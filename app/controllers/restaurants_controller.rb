class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def chinese
    @restaurants = Restaurant.where(category: 'chinese')
  end

  def french
    @restaurants = Restaurant.where(category: 'french')
  end

  def belgian
    @restaurants = Restaurant.where(category: 'belgian')
  end

  def italian
    @restaurants = Restaurant.where(category: 'italian')
  end

  def japanese
    @restaurants = Restaurant.where(category: 'japanese')
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
