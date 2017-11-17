class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  acts_as_votable

  scope :most_recent, -> (page_num) { order(created_at: :desc).limit(20).offset((page_num.to_i * 20) - 20)}

# scope :search, -> (search_parameter) { select("posts.id, posts.titles, posts.content, user.username as username").joins(:user).where("username like ?", "%#{search_parameter}%")}
# Post.joins(:user).where(users: {username: "Harwin"})
  scope :search, -> (search_parameter) { joins(:user).where("lower(title) like lower(?) OR lower(content) like lower(?) OR lower(users.username) like lower(?)", "%#{search_parameter}%", "%#{search_parameter}%", "%#{search_parameter}%")}
end
