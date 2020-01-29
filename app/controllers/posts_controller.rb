class PostsController < ApplicationController 

    def show 
        @post = Post.find_by(id: params[:id])
        options = {
            include: [:reaction]
        }
        render json: PostSerializer.new(@post.options).serialized_json
    end 

    def index 
        @posts = Post.all 
        options = {
            include: [:reactions]
        }

        # @json_ready_posts = @posts.map do |post|
        #     PostSerializer.new(post.options)
        # end 

        render json: PostSerializer.new(@posts, options).serialized_json
    end 

end 