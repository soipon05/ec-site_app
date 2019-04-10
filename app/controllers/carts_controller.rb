class CartsController < ApplicationController
  def index
    @cart = current_user.cart
    @products = @cart.cart_products
  end
end
