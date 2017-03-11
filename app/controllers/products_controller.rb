class LikesController < ApplicationController
	skip_before_filter :verify_authenticity_token,
	:if => Proc.new { |c| c.request.format == 'application/json' }
	skip_before_filter :verify_authenticity_token,
	:only => [:add_like, :remove_like]

	include HTTParty

	def new
		@product = Product.new
	end

	def create
		binding.pry
		@result = HTTParty.post(Figaro.env.SHOPIFY_ENDPOINT + "products.json",
		body: {product: {title: "Test Product", body_html: "Test Product", vendor: "", tags: ""}}.to_json,
		headers: { 'Content-Type' => 'application/json' } )
		binding.pry
	end

	def add_like
		product = Product.find(params['product_id'])
		product.likes += 1
		product.save
	end

	def remove_like
		product = Product.find(params['product_id'])
		product.likes -= 1 if product.likes > 0
		product.save
	end

	private

	def products_params
		params.require(:product).permit(:pid)
	end

end
