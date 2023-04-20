class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = Food.all
  end

  def show; end

  def new
    @recipe_food = RecipeFood.new
    @recipe_food.recipe_id = params[:recipe_id]
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to user_recipe_path(user_id: @recipe.user_id, id: @recipe.id),
                      notice: 'Recipe food was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to user_recipe_path(@recipe_food.recipe_id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
