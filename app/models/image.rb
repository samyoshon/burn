class Image < ActiveRecord::Base
	# include ImageUploader::Attachment.new(:image)
  	# mount_uploader :image_data, ImageUploader
	belongs_to :product
end
