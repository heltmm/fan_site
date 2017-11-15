# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


post_list = [
  ["Rick is an old man", 1, "Rick is too old and drunk all the time"],
  ["Morty is a little bitch", 2, "This is not Rick, morty is a little bitch"],
  ["Summer", 3, "She is supper annoying"]
]

post_list.each do |title, user_id, content|
  Post.create(title: title, user_id: user_id, content: content)
end
