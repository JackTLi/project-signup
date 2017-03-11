class Product < ApplicationRecord
	has_many :images
	has_many :tags, :through => :producttags
	accepts_nested_attributes_for :tags
end
