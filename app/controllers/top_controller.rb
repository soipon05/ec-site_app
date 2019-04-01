class TopController < ApplicationController

  def index
    @products = Product.all.order(id: :desc).limit(3)
  end
end
