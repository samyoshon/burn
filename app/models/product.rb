class Product < ActiveRecord::Base
	belongs_to :user
	belongs_to :market
	has_one :category
	
	validates :title, presence: true
	def user
    	User.unscoped { super }
   	end

   	def to_param
    	"#{id}-#{title}".parameterize
  	end
end
