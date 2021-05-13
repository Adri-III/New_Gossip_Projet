class PostsController < ApplicationController

    #filtres pr les actions show/edit/update/destroy
    before_action :set_post, only: [:show, :edit, :update, :destroy ]

    # GET /posts
    def index
        @post = Post.all
    end

    ## GET /posts/1 
    def show
    end

    ## GET /posts/1/edit
    def edit
    end

    # PATCH/PUT /posts/1
    def update
        @post.update(post_params)
        redirect_to posts_path
    end

    # GET /posts/new
    def new 
        @post = Post.new
    end

    # POST /posts
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            render "new"
            redirect_to @post_path, danger: "Invalid gossip ! Missing an argument."
            
        end
    end

    # DELETE /posts/1
    def destroy
        @post.destroy
        redirect_to posts_path
    end

#fin de ma classe
end


#######
private
#######

def set_post
    @post = Post.find(params[:id])
end

def post_params
    params.require(:post).permit(:title, :content)
end