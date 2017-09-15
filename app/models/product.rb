class Product < ActiveRecord::Base
	# include ImageUploader::Attachment.new(:image)

	belongs_to :user
	belongs_to :market
	belongs_to :category
	has_many :images
	
	mount_uploaders :images, ImageUploader
	accepts_nested_attributes_for :images

	validates :title, presence: true
	validates :category_id, presence: true
	validates :price, presence: true
	validates :description, presence: true


	
	def user
    	User.unscoped { super }
   	end

   	def to_param
    	"#{id}-#{title}".parameterize
  	end
end
