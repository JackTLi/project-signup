class Tag < ApplicationRecord
	has_many :producttags
	has_many :products, :through => :producttags
end
