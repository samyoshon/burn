class Product < ActiveRecord::Base
	belongs_to :user
	belongs_to :market

	def user
    	User.unscoped { super }
   	end

   	def to_param
    	"#{id}-#{title}".parameterize
  	end
end
