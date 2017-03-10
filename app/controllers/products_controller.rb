class ProductsController < ApplicationController
	include HTTParty

	def new

	end

  def create
  	binding.pry
  	@result = HTTParty.post(Figaro.env.SHOPIFY_ENDPOINT + "products.json", 
  	body: {product: {title: "Test Product", body_html: "Test Product" vendor: "", tags: ""}}.to_json, 
    headers: { 'Content-Type' => 'application/json' } )
  end


  private 

	def products_params
		params.require(:product).permit(:pid)
	end

end
