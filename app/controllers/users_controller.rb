class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user

  # def index
  #   @users = User.all
  #   @import = User::Import.new

  #   respond_to do |format|
  #     format.html
  #     format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
  #   end
  # end

  # def import
  #   @import = User::Import.new user_import_params
  #   if @import.save
  #     redirect_to users_path, notice: "Imported #{@import.imported_count} users"
  #   else
  #     @users = User.all
  #     flash[:alert] = "There were #{@import.errors.count} errors with your CSV file"
  #     render action: :index
  #   end
  # end

  def profile
    @user = current_user
  end

  def products
    @products = current_user.products.where(market: @market)
  end

  def update
    set_product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to :user_products, notice: 'Product was successfully deleted.' }
        format.json { render :user_products, status: :ok, location: :user_products }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def bookmarks

  end

  def forum_posts 
    @forum_posts = current_user.forum_posts
  end

  def notifications

  end

  def messages

  end

  private
    def set_user
      @user = current_user.id
    end 

    # def set_product
    #   @product = Product.find_by!(id: params[:product][:id], market: @market)
    # rescue
    #   flash[:alert] = "Product could not be found"
    #   redirect_to root_path
    # end
    
    # def set_product
    #   @product = Product.find(params[:product][:id])
    # end

    def user_import_params
      params.require(:user_import).permit(:file)
    end

    def product_params
      params.require(:product).permit(:user_id, :title, :description, :price, :market_id, :category_id, :expire_date)
    end
end
