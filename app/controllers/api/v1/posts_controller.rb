class Api::V1::PostsController < Api::V1::BaseController
  def index
    posts = Post.all
    render json: PostsDecorator.new(posts).as_json, status: 200
  end

  def show
    post = Post.find(params[:id])
    render json: PostDecorator.new(post).as_json, status: 200
  end
end
