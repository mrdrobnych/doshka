class PostsController < ApplicationController
before_action :authenticate_user!
  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.build_post(post_params)
  	if post.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def show
  	@post = Post.find_by(id: params[:id])
  end

  def edit
  	@post = Post.find_by(id: params[:id])
  end

  def update
  	@post = Post.find_by(id: params[:id])
    if @post.update(post_params)
  		redirect_to post_path(@post.id)
  	else
  		render 'edit'
  	end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
  	@post.destroy 
  	redirect_to root_path
  end

private 
  def post_params
  	params.require(:post).permit(:post_id, :title, :description, :price)
  end
end


