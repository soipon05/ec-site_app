class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to root_url, notice: "製品：「#{@product.name}」を登録しました"
    else
      render :new
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :status, :selllimit, :image)
  end
end
