class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image_url, :comment
  has_many :reactions
end
