class HomeController < ApplicationController
  def home
    @new_products = Product.last(5).reverse
  end
end
