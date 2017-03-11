class Product < ApplicationRecord
	has_many :images
	has_many :tags, :through => :producttags
	has_many :likes
end
