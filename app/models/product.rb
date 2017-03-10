class Product < ApplicationRecord
	has_many :images
	has_many :tags, :through => :producttags
end
