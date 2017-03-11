class Product < ApplicationRecord
	has_many :images
	has_many :tags, :through => :producttags
	has_many :likes
	accepts_nested_attributes_for :tags
end
