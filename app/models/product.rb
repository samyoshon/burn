class Product < ActiveRecord::Base
	include ImageUploader::Attachment.new(:image)
	belongs_to :user
	belongs_to :market
	belongs_to :category
	
	validates :title, presence: true
	def user
    	User.unscoped { super }
   	end

   	def to_param
    	"#{id}-#{title}".parameterize
  	end
end
