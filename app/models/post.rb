class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  include PgSearch
  pg_search_scope :kinda_matching, against: :title, using: {
                                                      tsearch: {dictionary: "english"}
                                                    }

  default_scope { order(created_at: :desc) }

  acts_as_votable
  acts_as_taggable
  attr_accessor :tags

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :body, presence: true, length: 2..300

  self.per_page = 10

  def self.search_by_title(query)
    kinda_matching(query)
  end

  DEFAULTS = ["earth, sports, programming"]

end

