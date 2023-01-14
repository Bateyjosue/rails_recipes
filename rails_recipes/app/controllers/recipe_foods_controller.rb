class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where(user_id: current_user.id)
  end

  def create
    @recipe_food = RecipeFood.new(rec_food_params)
    @recipe = Recipe.find(params[:recipe_id])

    @recipe_food.recipe_id = @recipe.id

    if @recipe_food.save
      flash[:notice] = 'Food is added successfully'
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = 'Food is not added!!!'
      redirect_to new_recipe_recipe_food_path(@recipe)
    end
  end

  def destroy
    RecipeFood.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def rec_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
