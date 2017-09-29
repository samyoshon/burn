class ForumThreadsController < ApplicationController
  before_action :set_forum_thread, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @q = ForumThread.search(params[:q])

    @forum_threads = ForumThread.where("market_id = ?", @market.id)
    
    if params[:q].present?
      @forum_threads = @q.result.where("market_id = ?", @market.id)
    end

    @banner = Banner.first
  end

  def show
    @forum_post = ForumPost.new

    @banner = Banner.first
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
    @banner = Banner.first
  end

  def create
    @forum_thread = current_user.forum_threads.build(forum_thread_params)
    @forum_thread.market_id = @market.id
    @forum_thread.forum_posts.first.user_id = current_user.id

    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
  end

  private

    def set_forum_thread
      @forum_thread = ForumThread.find_by!(id: params[:id], market: @market)
    rescue
      flash[:alert] = "Thread could not be found"
      redirect_to root_path
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject, :forum_category_id, :market_id, forum_posts_attributes: [:body])
    end
end
