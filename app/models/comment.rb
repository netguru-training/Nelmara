class Comment < ActiveRecord::Base
  belongs_to :post

  validates :body, presence: true, length: 2..140

end

