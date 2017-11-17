# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Comment.destroy_all

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

users = []

300.times do |user|
  possible_user = Faker::Pokemon.name
  if !users.include?(possible_user)
    users.push(possible_user)
    User.create!(email: Faker::Internet.email,
                          username: possible_user,
                          password: "password")
  end
end
p "Created #{User.count} users"

100000.times do |index|
  current_post = Post.create!(title: Faker::Hipster.sentence,
                        content: Faker::Hipster.paragraph,
                        user_id: Faker::Number.between(User.first.id, User.last.id)
                        )

end

20000.times do |index|
  Comment.create!(content: Faker::Hipster.paragraph,
                        user_id: Faker::Number.between(User.first.id, User.last.id),
                        post_id: Faker::Number.between(Post.first.id, Post.last.id)
                        )
end

# seed votes
# users = User.all

# users.each do |user|
#   6.times do
#     current_post = Post.find(Faker::Number.between(Post.first.id, Post.last.id))
#     current_post.vote_by :voter => user, :vote => 'like'
#   end
#   current_post = Post.find(Faker::Number.between(Post.first.id, Post.last.id))
#   current_post.vote_by :voter => user, :vote => 'bad'
# end

p "Created #{User.count} users"
p "Created #{Post.count} posts"
p "Created #{Comment.count} comments"
