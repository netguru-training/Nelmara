class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: 2..140
  validates :user, presence: true

  acts_as_votable

  default_scope { order("cached_votes_score DESC") }
end

