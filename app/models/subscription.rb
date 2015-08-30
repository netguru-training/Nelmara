class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :user, :tagname, presence: true
end
