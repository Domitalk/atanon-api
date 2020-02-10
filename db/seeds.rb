# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'faker'



Post.destroy_all
Reaction.destroy_all 
Stag.destroy_all
PostStag.destroy_all 

# p1 = Post.create(
#     comment: "History began July 4th, 1776. Anything before that was a mistake.",
#     image_url: "https://66.media.tumblr.com/ca727f22da4bf00acd4cb792f0658f57/tumblr_mngyjtuwv51qhptfbo1_1280.png"
# )
# p2 = Post.create(
#     image_url: "http://brunswicktimesrecord.demo.our-hometown.com/wp-content/uploads/images/2018-04-24/6p1.jpg",
#     comment: "When I eat, it is the food that is scared."
# )
# p3 = Post.create(
#     image_url: "https://townsquare.media/site/341/files/2012/09/cat2-e1347980878264.jpg?w=630&q=75",
#     comment: "Dear frozen yogurt, you are the celery of desserts. Be ice cream or be nothing. Zero stars."
# )
# p4 = Post.create(
#     image_url: "https://thefrisky.com/wp-content/uploads/2019/04/grumpy-cat-1-748x421.jpg",
#     comment: "I believe luck is a concept invented by the weak to explain their failures."
# )
# p5 = Post.create(
#     image_url: "https://cdn.pastemagazine.com/www/system/images/photo_albums/cats-that-look-like-ron-swanson/large/photo_30727_0-18.jpg?1384968217",
#     comment: "The government is a greedy piglet that suckles on a taxpayer's teat until they have sore, chapped nipples."
# )
# p6 = Post.create(
#     image_url: "https://66.media.tumblr.com/4b2aa53d5f3f06f6262c16d72a1e0d24/tumblr_mnbtcqCvFH1qhptfbo1_640.png",
#     comment: "There has never been a sadness that can’t been cured by breakfast food."
# )
# p7 = Post.create(
#     image_url: "https://images.squarespace-cdn.com/content/v1/55cc0e9ce4b09e646fec883d/1462330497348-H8QDE5UHTTW454R6BH5B/ke17ZwdGBToddI8pDm48kJG-lwx-ydacrGvWJ1E8uYN7gQa3H78H3Y0txjaiv_0f0RFAW16tgzDazO3NMD7c9vK_nQVZgijyDnglvVu8qqqsItIhYBC90LuJaYL0c21FmbLecD_NwfjqNxjfNDWHyHVe3BwRwwd-BktgihOOlCq4EN07C515vx5rnQ9h1Fid/image-asset.jpeg",
#     comment: "Son, there is no wrong way to consume alcohol."
# )
# p8 = Post.create(
#     image_url: "https://i.redd.it/22eayny0y6s31.jpg",
#     comment: "Honor: if you need it defined, you don't have it."
# )
# p9 = Post.create(
#     image_url: "https://cdn.pastemagazine.com/www/system/images/photo_albums/cats-that-look-like-ron-swanson/large/photo_30728_0-18.jpg?1384968217",
#     comment: "Creativity is for people with glasses who like to lie."
# )

# 100.times do
#     Reaction.create(
#         post: Post.all.sample,
#         rtype: rand(1..4)
#     )
# end 


# https://api.thecatapi.com/v1/images/search

# ronUrl = "http://ron-swanson-quotes.herokuapp.com/v2/quotes"
# # data = JSON.parse(open(url).read)

url = "https://api.thecatapi.com/v1/images/search"
uri = URI(url)

ronUrl = "http://ron-swanson-quotes.herokuapp.com/v2/quotes"
ronUri = URI(ronUrl)

60.times do 
    Post.create(
        image_url: JSON.parse(Net::HTTP.get(uri))[0]["url"],
        comment: JSON.parse(Net::HTTP.get(ronUri))[0]
    )
end 

300.times do
    Reaction.create(
        post: Post.all.sample,
        rtype: rand(1..4)
    )
end 

20.times do 
    Stag.create(
        stagname: Faker::Hipster.word
    )
end 

300.times do 
    PostStag.create(
        post: Post.all.sample,
        stag: Stag.all.sample
    )
end 
# Post.create(
#     image_url: JSON.parse(open(url).read)[0].url,
#     comment: JSON.parse(open(ronUrl).read)
# )

# p = Post.create(
#     image_url: "",
#     comment: 
# )

# JSON.parse(open("https://api.thecatapi.com/v1/images/search").read)