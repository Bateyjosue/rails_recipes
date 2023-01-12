class FoodController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
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

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = "#{@food.name} has been destroyed"
    redirect_to food_index_path
  end
  
  private

  def food_params
    params.require(:food).permit(:name, :meeasurment_unit, :price, :quantity)
  end

end
