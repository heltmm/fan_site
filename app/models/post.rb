class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  acts_as_votable

  scope :most_recent, -> (page_num) { order(created_at: :desc).limit(20).offset((page_num.to_i * 20) - 20)}

  scope :search, -> (search_parameter) { where("title like ? OR content like ?", "%#{search_parameter}%", "%#{search_parameter}%")}
end
