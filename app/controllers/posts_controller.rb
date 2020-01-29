class PostsController < ApplicationController 

    def create 
        @post = Post.create(post_params)
        
        render json: @post.to_json 
    end 

    def show 
        @post = Post.find_by(id: params[:id])
        @shaped_post = {
                id: @post.id,
                image_url: @post.image_url, 
                comment: @post.comment, 
                heart: 0,
                smile: 0, 
                sad: 0,
                angry: 0
        }

        @reactions = Reaction.all 

        @reactions.each do |reaction|
            if (reaction.post_id === @post.id) 
                case reaction.rtype 
                when 1 
                    @shaped_post[:heart] += 1 
                when 2 
                    @shaped_post[:smile] += 1 
                when 3 
                    @shaped_post[:sad] += 1 
                when 4 
                    @shaped_post[:angry] += 1
                end 
            end
        end

        render json: @shaped_post.to_json

        # options = {
        #     include: [:reaction]
        # }
        # render json: PostSerializer.new(@post, options).serialized_json
    end 

    def index 
        @posts = Post.all 
        @reactions = Reaction.all 

        @organized = []

        @posts.each do |post|
            @shaped_post = {
                id: post.id,
                image_url: post.image_url, 
                comment: post.comment, 
                heart: 0,
                smile: 0, 
                sad: 0,
                angry: 0
            }
            # @shaped_post.id = post.id 
            # @shaped_post.image_url = post.image_url 
            # @shaped_post.comment = post.comment 
            # @shaped_post.one = 0 
            # @shaped_post.two = 0 
            # @shaped_post.three = 0 
            # @shaped_post.four = 0 
        
            @reactions.each do |reaction|
                if (reaction.post_id === post.id) 
                    case reaction.rtype 
                    when 1 
                        @shaped_post[:heart] += 1 
                    when 2 
                        @shaped_post[:smile] += 1 
                    when 3 
                        @shaped_post[:sad] += 1 
                    when 4 
                        @shaped_post[:angry] += 1
                    end 
                end
            end
            @organized.push(@shaped_post)
        end 

        render json: @organized.to_json

        # options = {
        #     include: [:reactions]
        # }

        # @json_ready_posts = @posts.map do |post|
        #     PostSerializer.new(post.options)
        # end 

        # render json: PostSerializer.new(@posts, options).serialized_json
    end 

    private 

    def post_params 
        params.permit(:image_url, :comment)
    end 

end 