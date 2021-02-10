class PostsController < ApplicationController
  def index # indexアクションの定義
    @posts = Post.all.order(id: 'DESC')
  end

  def create
    binding.pry
    post = Post.new(content: params[:content])
    post.save
    # Post.create(content: params[:content])
    redirect_to action: :index
  end
end
