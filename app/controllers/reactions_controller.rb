class ReactionsController < ApplicationController 

    def create 
        # @post = Post.find_by(id: params[:id])
        Reaction.create({
            reaction_params 
        })
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
        
    end 

    private 

    def reaction_params 
        params.permit(:post_id, :rtype)
    end 


end 