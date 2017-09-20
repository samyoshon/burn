class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    # @q = Product.search(params[:q])
    # @products = @q.result(distinct: true)

    # @products_all = Product.where(["created_at > ?", 360.days.ago])

    @q = Product.search(params[:q])

    @products = Product.all.where(market: @market)
    if params[:q].present?
      @products = @q.result.where(market: @market)
    end

    # if params[:location].present?
    #   @products = @products.near(params[:location]).where(market: @market)
    # end

    # @products = @products.paginate(:page => params[:page], :per_page => 30)
  end

  # What is this supposed to do again?
  # def search
  #   index
  #   render :index
  # end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    @product.market_id = @market.id
    # @product.user_id = current_user.id

    if @product.save
      redirect_to @product
    else
      render action: :new
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # def set_market
  #   @market = Market.find_by_subdomain!(request.subdomain) unless request.subdomain.empty?
  # end

  # def set_product
  #   @product = Product.find(params[:id])
  # end

  def set_product
    @product = Product.find_by!(id: params[:id], market: @market)
  rescue
    flash[:alert] = "Product could not be found"
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit(:user_id, :title, :description, :price, :market_id, :category_id, :expire_date, {images:[]})
      # , images_attributes: [:id, :image, :image_data, :product_id])
  end

end
