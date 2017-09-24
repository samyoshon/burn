class Market < ActiveRecord::Base
	# include ImageUploader::Attachment.new(:image)
	# acts_as_paranoid

	belongs_to :user
	has_many :products
	has_many :forum_threads

	# accepts_nested_attributes_for :products
	
	validates :title, presence: true
	validates_associated :products
	validates_associated :forum_threads
end
