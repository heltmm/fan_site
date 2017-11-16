# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all

# post_list = [
#   ["Rick is an old man", 1, "Rick is too old and drunk all the time"],
#   ["Morty is a little bitch", 2, "This is not Rick, morty is a little bitch"],
#   ["Summer", 3, "She is supper annoying"]
# ]

user_list = [
  ["mark@mark.com", "Mark", "111111"],
  ["aaron@aaro.com", "Aaron", "111111"],
  ["javi@javi.com", "Javi", "111111"]
]

user_list.each do |email, username, password|
  User.create!(email: email, username: username, password: password)
end

50.times do |index|
  Post.create!(title: Faker::Hipster.sentence,
                        content: Faker::Hipster.paragraph,
                        user_id: Faker::Number.between(User.first.id, User.last.id)
                        )
end
