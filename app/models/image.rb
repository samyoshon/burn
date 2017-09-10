class Image < ActiveRecord::Base
	include ImageUploader::Attachment.new(:image)
	belongs_to :product
end
