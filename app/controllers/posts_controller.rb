class PostsController < ApplicationController 

    def create 
        @post = Post.create(post_params)
        render json: @post.to_json 
    end 

    def show
        @posts = Post.all 
        @organized = []

        # sort and reverse so that newest shows first 
        @posts = @posts.sort_by { |post| post.created_at }
        @posts = @posts.reverse()
    
        #find where last fetch left off 
        @index = @posts.index(@posts.find{ |post| post.id === params[:id].to_i})
        @index = @index + 1
        @plus10 = @index + 9

        #get 10 new ones 
        @posts = @posts[@index..@plus10]

        #add all the related data 
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
             #add reactions to object which will be json'ed 
             post.reactions.each do |reaction|
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
            post.post_stags.each do |post_stag|
                if @shaped_post[:stags][post_stag.stag.stagname]
                    @shaped_post[:stags][post_stag.stag.stagname] += 1
                else 
                    @shaped_post[:stags][post_stag.stag.stagname] = 1
                # post_stag.stag.stagname
                end 
            end 
            
            @organized.push(@shaped_post)
        end

        render json: @organized.to_json

    end 

    def index 
        @posts = Post.all 
        # @reactions = Reaction.all 

        #show newest first, get 20 
        @posts = @posts.sort_by { |post| post.created_at }
        @posts = @posts.reverse()
        @posts = @posts[0..19]

        @organized = []

        #add related data 
        @posts.each do |post|
            @shaped_post = {
                id: post.id,
                image_url: post.image_url, 
                comment: post.comment, 
                heart: 0,
                smile: 0, 
                sad: 0,
                angry: 0, 
                stags: {}
            }
            #add reactions to each post object
            post.reactions.each do |reaction|
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

            post.post_stags.each do |post_stag|
                if @shaped_post[:stags][post_stag.stag.stagname]
                    @shaped_post[:stags][post_stag.stag.stagname] += 1
                else 
                    @shaped_post[:stags][post_stag.stag.stagname] = 1
                # post_stag.stag.stagname
                end 
            end 
            

            @organized.push(@shaped_post)
        end 

        render json: @organized.to_json

    end 

    private 

    def post_params 
        params.permit(:image_url, :comment)
    end 

end 