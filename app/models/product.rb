class Product < ActiveRecord::Base
	include ImageUploader::Attachment.new(:image)
	belongs_to :user
	belongs_to :market
	belongs_to :category
	has_many :images
	
	validates :title, presence: true
	accepts_nested_attributes_for :images
	validates_associated :images
	
	def user
    	User.unscoped { super }
   	end

   	def to_param
    	"#{id}-#{title}".parameterize
  	end
end
