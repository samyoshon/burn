class Image < ActiveRecord::Base
	include ImageUploader[:image]
	belongs_to :product
end
