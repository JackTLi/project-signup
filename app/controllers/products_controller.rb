class ProductsController < ApplicationController
	skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

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


  private 

		def products_params
			params.require(:product).permit(:pid)
		end

end
