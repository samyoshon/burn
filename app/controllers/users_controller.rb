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
    @products = current_user.products
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
     
    def user_import_params
      params.require(:user_import).permit(:file)
    end
end
