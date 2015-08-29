class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: 2..140

  acts_as_votable

  def total_votes
    votes_for.up.size - votes_for.down.size
  end
end

