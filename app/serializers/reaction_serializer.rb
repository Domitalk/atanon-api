class ReactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :reaction_type 
  belongs_to :post
end
