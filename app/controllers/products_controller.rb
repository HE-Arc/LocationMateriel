class ProductsController < ApplicationController

  def index
    @product = Product.all
    if params[:search]
      @product = Product.search(params[:search]).order("created_at DESC")
    else
     @product = Product.all.order('created_at DESC')
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  #def search
   # title = params[:title]
    #description = params[:description]
    #price = params[:price]
    #@product = Product.search(title, description, price)
  #end

  def new
    @product= Product.new
  end

  def create
    @product= Product.new(products_params)

    if @product.save
      redirect_to @product, success: "Produit créé !!!"
    else 
      flash.now[:error]="les champs du produit ont été ,mal remplis"
      render "new"
    end
  end

  def destroy
  end

  protected
  def products_params
    params.require(:product).permit(:title, :description, :price, :renter, :date_start, :date_end, :condition, :image)
  end  

  
end
