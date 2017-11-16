class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  acts_as_votable
  scope :twenty_most_recent, -> { order(created_at: :desc).limit(20)}
end
