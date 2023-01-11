class FoodController < ApplicationController
  def index
    @foods = Food.includes(:user)
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      flash['notice'] = 'Food Create Successfully'
      redirect_to food_index_path
    else
      render :new, alert: 'Error: Post not saved.'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :meeasurment_unit, :price, :quantity)
  end

  def destroy; end
end
