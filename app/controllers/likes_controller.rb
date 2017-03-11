class LikesController < ApplicationController

	include HTTParty

	def add_like
		# update likes count in Products table
		product = Product.find(params['product_id'])
		product.likes_count += 1
		product.save
		# update the Likes table
		@like = Like.new(product_id: params['product_id'], user_id: params['user_id'])
		@like.save
	end

	def remove_like
		# update likes count in Products table
		product = Product.find(params['product_id'])
		product.likes_count -= 1 if product.likes_count > 0
		product.save
		# update the Likes table
		@like = Like.where(product_id: params['product_id']).destroy
		@like.save
	end
	
	def likes_count
		@result = HTTParty.post(
		Figaro.env.SHOPIFY_ENDPOINT + "products.json",
		body: {likes_count: Likes.where(product_id: params['product_id']).count}.to_json,
		headers: { 'Content-Type' => 'application/json' }
		)
	end

	private

	def products_params
		params.require(:product).permit(:pid)
	end
end
