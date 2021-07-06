class PostsController < ApplicationController
  before_action :set_post, only: %i[ destroy ]

  # GET /posts or /posts.json
  def index
    @post = Post.new
    @posts = Post.includes(:user).page(params[:page]).per(20).order(id: "desc")
  end

  # POST /posts or /posts.json
  def create
    if logged_in?
      @post = @current_user.posts.create(post_params)
    else
      @post = Post.create(post_params)
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "投稿を削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content)
    end
end
