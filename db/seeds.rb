# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
Comment.destroy_all


posts = []

(1..20).each do |n|
	posts << Post.create(title: "Post nº #{n}", content: "COmentario del post numero #{n}")
end

comments= []
(1..50).each do |n|
	comments << Comment.create( content: " Comentario numero #{n}", post: posts[rand(1..(posts.length))])
end


