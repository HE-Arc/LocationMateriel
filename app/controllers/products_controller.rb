class ProductsController < ApplicationController

  def show
    @product = Product.joins(:questions).find(params[:id])
  end

  def location
    @product = Product.find(params[:id])
  end
end
