class ForumPost < ActiveRecord::Base
  # include ImageUploader::Attachment.new(:image)
  mount_uploaders :images, ImageUploader
  belongs_to :user
  belongs_to :forum_thread

  validates :body, presence: true

  def user
    User.unscoped { super }
  end

  def send_notifications!
    users = forum_thread.users.uniq - [user]
    users.each do |user|
      NotificationMailer.forum_post_notification(user, self).deliver_later
    end
  end

end
