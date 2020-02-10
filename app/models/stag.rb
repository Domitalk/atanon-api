class Stag < ApplicationRecord
    has_many :post_stags, dependent: :destroy
    has_many :posts, through: :post_stags
end
