class Markets::ProductsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  def index
    @q = Product.search(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new product_params
    # @product.user_id = current_user.id

    if @product.save
      redirect_to @product
    else
      render action: :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:user_id, :title, :description, :price)
  end

end
