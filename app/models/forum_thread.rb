class ForumThread < ActiveRecord::Base
  # include ImageUploader::Attachment.new(:image)
  acts_as_paranoid

  belongs_to :user
  has_many :forum_posts
  has_many :users, through: :forum_posts

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true
  validates_associated :forum_posts

  def to_param
    "#{id}-#{subject}".parameterize
  end
end
