class User < ApplicationRecord
  mount_uploader :images, ImageUploader
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :confirmable, :validatable

  # validates :email, email_format: true

  has_many :forum_threads
  has_many :forum_posts
  has_many :markets
  has_many :products


  def self.assign_from_row(row)
    user = User.where(email: row[:email]).first_or_initialize
    user.assign_attributes row.to_hash.slice(:first_name, :last_name, :market_id, :images, :admin, :is_advertiser, :is_mod)
  end

  def self.to_csv
    attributes = %w{id email name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def name
    if deleted_at?
      "Deleted User"
    else
      "#{first_name} #{last_name}"
    end
  end
end
