class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def show
  @product = Product.joins(:questions).find(params[:id])

  end

  def edit
  end

  def update
  end

  def new
    @product= Product.new
  end

  def create
    @product= Product.new(products_params)

    if @product.save
      redirect_to @product, success: "Produit créer !!!"
    else 
      flash.now[:error]="les champs du produit ont été ,mal remplis"
      render "new"
    end

  end

  def destroy
  end

  protected
  def products_params
    params.require(:product).permit(:title, :description, :price, :renter, :condition, :image)
  end  

  
end
