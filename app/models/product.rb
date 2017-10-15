class Product < ApplicationRecord

	mount_uploaders :images, ImageUploader
	# include ImageUploader::Attachment.new(:image)
	

	belongs_to :user
	belongs_to :market
	belongs_to :category

	has_many :flags

	# validates :title, presence: true, :email_format => true
	# # validates :title, presence: true
	# validates :category_id, presence: true
	# validates :price, presence: true
	# validates :description, presence: true

	def user
    	User.unscoped { super }
   	end

   	def to_param
    	"#{id}-#{title}".parameterize
  	end
end
