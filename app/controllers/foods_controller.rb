class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
  
    
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
  
    return unless @food.save
    redirect_to foods_path, notice: 'Food was successfully created.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
