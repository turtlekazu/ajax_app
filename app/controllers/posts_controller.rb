class PostsController < ApplicationController
  def index # indexアクションの定義
    @posts = Post.all.order(id: 'DESC')
  end

  def create
    post = Post.new(content: params[:content], checked: false)
    post.save
    # Post.create(content: params[:content])
    render json: {post: post}
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: {post: item}
  end
end
