class PostsController < ApplicationController

  before_filter :sign_in_user

  def create
    post = current_user.posts.build(post_params(params))

    if post.save
      redirect_to current_user
    else
      render users_path
    end

  end

  def destroy
  end

  def show
  	@post = Post.find_by_id(params[:id])
  end

  private
    def post_params(params)
      params.require(:post).permit(:user_id, :content)
    end
end
