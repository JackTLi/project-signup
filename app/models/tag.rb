class Tag < ApplicationRecord
	has_many :products, :through => :producttags
end
