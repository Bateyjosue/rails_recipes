class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save!
      flash[:notice] ="Recipe created successfully"
      redirect_to recipes_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy!
      flash[:notice] = "recipe has been successfully deleted"
      redirect_to recipes_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
