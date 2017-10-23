class User < ApplicationRecord
  mount_uploader :images, ImageUploader
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable # , :confirmable
  # accepts_nested_attributes_for :markets
  
  validates :email, email_format: true
  validates_uniqueness_of :username

  belongs_to :market
  has_many :forum_threads
  has_many :forum_posts
  
  has_many :products


  def self.assign_from_row(row)
    user = User.where(email: row[:email]).first_or_initialize
    user.assign_attributes row.to_hash.slice(:first_name, :last_name, :market_id, :phone_number, :images, :admin, :is_advertiser, :is_mod, :username)
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

  private 

  # def validate_email
  #   return if $current_market.blank? || $current_market.email_address_type?
  #   return if email.include?($current_market.email_address_type)
  #   errors.add(:email, "must be your student email address (ex: sshon@#{$current_market.email_address_type})")
  # end

end