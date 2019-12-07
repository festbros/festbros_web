class PostsController < ApplicationController
	 # before_action :find_post, only: [:show, :update, :edit, :destroy]
	 before_action :require_login
 
 

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		find_post(params[:id])
		# @post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path

	end

	private

	def post_params
		params.require(:post).permit(:title, :content,:url)
	end

	def find_post (id)
		@post = Post.find(id)
	end

	private
 
	def require_login
	  if  session[:user_id]  ==nil
		flash[:error] = "You must be logged in to access this section"
		redirect_to '/auth/login' 
	  end
	end
end
