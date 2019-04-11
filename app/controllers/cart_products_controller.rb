class CartProductsController < ApplicationController
  def create
    @cart = current_user.cart
    product = Product.find(Hashids.new("test").decode(params[:product_id])).join)
    @cart_product = @cart.cart_products
    if CartProduct.add_product(product.id, @cart)
      redirect_to carts_path
    else
      flash[:error] = 'カートへの追加に失敗しました'
      redirect_to product_path(product)
    end
  end
end
