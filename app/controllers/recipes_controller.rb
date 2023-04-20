class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = @recipe.recipe_food
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def public_recipes
    @recipes = Recipe.includes(:user, recipe_foods: [:food]).where(public: true).order(:id)
    @total_price = []
    @recipe.each do |recipe|
      @total_price << recipe.recipe_foods.inject(0) { |sum, recipe_food| sum + (recipe_food.food.price * recipe_food.quantity) }
    end
  end

  def shopping_list
    @ingredient = RecipeFood.includes(:food).where(recipe_id: params[:recipe_id])
    @total_price = @ingredient.inject(0) { |sum, recipe_food| sum + (recipe_food.food.price * recipe_food.quantity) }
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_path, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
