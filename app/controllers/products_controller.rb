class ProductsController < ApplicationController
	skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

	include HTTParty

	def new
		@product = Product.new
	end

  def create
  	@result = HTTParty.post(Figaro.env.SHOPIFY_ENDPOINT + "products.json", 
  	body: {product: {title: params[:product][:title], body_html: params[:product][:body_html], vendor: params[:product][:vendor]} }.to_json, 
    headers: { 'Content-Type' => 'application/json' } )
  end


  private 

		def products_params
			params.require(:product).permit(:pid)
		end

end
