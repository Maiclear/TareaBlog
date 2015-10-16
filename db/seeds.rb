# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
Comment.destroy_all
Tag.destroy_all



# (1..20).each do |n|
# 	posts << Post.create(title: "Post nº #{n}", content: "COmentario del post numero #{n}")
# end


# (1..50).each do |n|
# 	comments << Comment.create( content: " Comentario numero #{n}", post: posts[rand(1..(posts.length))])
# end

posts = []

(1..50).each do |m|
	posts << Post.create(
	                      title: Faker::Company.name,
	                      content: Faker::Lorem.paragraph(3)
	                      )

end


comments= []

(1..20).each do |r|
	comments << Comment.create(
	                         content: Faker::Lorem.paragraph(3),
	                         post: posts[rand(posts.length)]
	                         )
end

tags=[]

tags << Tag.create(name: 'Pop')
tags << Tag.create(name: 'Rock')
tags << Tag.create(name: 'Alternative')
tags << Tag.create(name: 'Shoegaze')
tags << Tag.create(name: 'Punk')
tags << Tag.create(name: 'Grunge')
tags << Tag.create(name: 'Classic')
tags << Tag.create(name: 'Acustic')
tags << Tag.create(name: 'Blues')
tags << Tag.create(name: 'Jazz')


