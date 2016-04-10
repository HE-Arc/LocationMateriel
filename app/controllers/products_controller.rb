class ProductsController < ApplicationController

  def index
    @product = Product.all
    @search = Search.new(:product, params[:search], :per_page => 2)
    @search.order = 'last_name'
    @product = @search.run

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def show
  @product = Product.joins(:questions).find(params[:id])
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
