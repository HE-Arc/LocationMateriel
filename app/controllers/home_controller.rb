class HomeController < ApplicationController
  def home
    @newProduct = Product.last(5).reverse
  end
end
