class RecipesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    @recipes = if params[:user_id].present?
                 Recipe.includes(recipe_foods: [:food]).order(:id)
               else
                 Recipe.all
               end
  end

  def show
    @recipe = Recipe.find(params[:id])
    return if @recipe.nil?

    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_path, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to user_recipe_path, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
