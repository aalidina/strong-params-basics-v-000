class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  # @post = Post.new(params["post"])
	  # @post.save
		# @post = Post.new(params.require(:post).permit(:title, :description))

		@post = Post.new(post_params(:title, :description))
  	@post.save
	  redirect_to post_path(@post)
	end

	def update
	   @post = Post.find(params[:id])
	  # @post.update(params["post"])
  	# @post.update(params.require(:post).permit(:title))
  	# @post.update(post_params)post_params is private method below
		@post.update(post_params(:title))# post_params method takes arguments
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private

	# def post_params
	#   params.require(:post).permit(:title, :description)
	# end

	# We pass the permitted fields in as *args;
	# this keeps `post_params` pretty dry while
	# still allowing slightly different behavior
	# depending on the controller action
	def post_params(*args)
	  params.require(:post).permit(*args)
	end
end
