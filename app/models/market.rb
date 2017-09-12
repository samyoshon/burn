class Market < ActiveRecord::Base
	# include ImageUploader::Attachment.new(:image)
	# acts_as_paranoid

	belongs_to :user
	has_many :products

	# accepts_nested_attributes_for :products
	
	validates :title, presence: true
	validates_associated :products
end
