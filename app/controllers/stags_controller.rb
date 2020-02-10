class StagsController < ApplicationController 

    
    def create
        # check if stag with stagname already exists 
        @stags = Stag.all 
        @post = Post.all.find{ |post| post.id === stag_params['post_id'] }
        @shaped_post = {
            id: @post.id,
            image_url: @post.image_url, 
            comment: @post.comment, 
            heart: 0,
            smile: 0, 
            sad: 0,
            angry: 0, 
            stags: {}
        }

        @post.reactions.each do |reaction|
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

        if (@foundstag = @stags.find { |stag| stag.stagname === stag_params['stagname'] })
            PostStag.create({
                post: @post, 
                stag: @foundstag
            })
        else 
            @stag = Stag.create({
                stagname: stag_params['stagname']
            })
            PostStag.create({
                post: @post, 
                stag: @stag
            })
        end 

        @post.post_stags.each do |post_stag|
            if @shaped_post[:stags][post_stag.stag.stagname]
                @shaped_post[:stags][post_stag.stag.stagname] += 1
            else 
                @shaped_post[:stags][post_stag.stag.stagname] = 1
            # post_stag.stag.stagname
            end 
        end 

        render json: @shaped_post.to_json

        # if no, create new stag
        # then create new post_stag 
        # if yes, create new post_stag  

        # puts stag_params
        # return a post object with all the associated data 
        # 
        # change post controller so that the json return val matches the new format 
        #
        
    end 

    private 

    def stag_params
        params.permit(:post_id, :stagname)
    end 


end