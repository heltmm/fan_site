# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Comment.destry_all

# post_list = [
#   ["Rick is an old man", 1, "Rick is too old and drunk all the time"],
#   ["Morty is a little bitch", 2, "This is not Rick, morty is a little bitch"],
#   ["Summer", 3, "She is supper annoying"]
# ]

user_list = [
  ["mark@mark.com", "Mark", "password"],
  ["aaron@aaro.com", "Aaron", "password"],
  ["javi@javi.com", "Javi", "password"]
]

user_list.each do |email, username, password|
  User.create!(email: email, username: username, password: password)
end

20.times do |index|
  User.create!(email: Faker::Internet.email,
                        username: Faker::GameOfThrones.character,
                        password: "password")
end

50.times do |index|
  Post.create!(title: Faker::Hipster.sentence,
                        content: Faker::Hipster.paragraph,
                        user_id: Faker::Number.between(User.first.id, User.last.id)
                        )
end

50.times do |index|
  Comment.create!(content: Faker::Hipster.paragraph,
                        user_id: Faker::Number.between(User.first.id, User.last.id),
                        post_id: Faker::Number.between(Post.first.id, Post.last.id)
                        )
end

p "Created #{User.count} users"
p "Created #{Post.count} posts"
p "Created #{Comment.count} comments"
