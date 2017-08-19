class Markets::ProductsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_market

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
    @product.market_id = @market.id
    # @product.user_id = current_user.id

    if @product.save
      redirect_to @market
    else
      render action: :new
    end
  end

  private

  def set_market
    @market = Market.find(params[:market_id])
  end

  def product_params
    params.require(:product).permit(:user_id, :title, :description, :price, :market_id)
  end

end
