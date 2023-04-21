class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @recipes = Recipe.where(public: true).includes(:user).order('created_at DESC')
    @ingredients = RecipeFood.all
  end
end
