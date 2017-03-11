class LikesController < ApplicationController
	skip_before_filter :verify_authenticity_token,
	:if => Proc.new { |c| c.request.format == 'application/json' }
	skip_before_filter :verify_authenticity_token,
	:only => [:add_like, :remove_like]

	include HTTParty

	def index
	end

	def new
		@product = Product.new
    @tags = Tag.all
	end
  def create
  	@result = HTTParty.post(Figaro.env.SHOPIFY_ENDPOINT + "products.json",
  	body: {product: {title: params[:product][:title], body_html: params[:product][:body_html], vendor: params[:product][:vendor]} }.to_json,
    headers: { 'Content-Type' => 'application/json' } )
    binding.pry

    @product = Product.new(products_params.merge(pid: @result["product"]["id"], vid: @result["product"]["variants"][0]["id"]))
    if @product.save

      redirect_to root_path
    end


  end

  def show


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
			params.require(:product).permit(:title, :body_html, :vendor)
		end

end
