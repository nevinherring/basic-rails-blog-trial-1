class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :show, :delete]

    #Index action to render all posts
    def Index
        @posts = Post.all
    end

    # New action for creating post
    def New
        @post = Post.new
    end

    # create action saves the post into database
    def create
        @post = Post.new
        if @post.save(post_params)
            flash[:notice] = "Successfully created post!"
            redirect_to post_path(@post)
        else
            flash[:alert] = "Error creating new post!"
            render :new
        end
    end

    # Edit action retrieves the post and renders the edit page
    def edit
    end

    #update action updates the post with the new information
    def update
        if @post.update_attributes(post_params)
            flash[:notice] = "Successfully update post!"
            redirect_to post_path(@posts)
        else
            flash[:alert] = "Error updating post!"
            render :edit
        end
    end

    #the show action renders the individual post after retrieving the id
    def show
    end

    #the destroy action removes the post permanently from the database
    def destroy
        if @post.destroy
            flash[:notice] = "Successfully deleted post!"
            redirect_to posts_path
        else
            flash[:alert] = "Error updating post!"
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end
