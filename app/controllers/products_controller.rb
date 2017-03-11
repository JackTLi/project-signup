class ProductsController < ApplicationController
	skip_before_filter :verify_authenticity_token,
	:if => Proc.new { |c| c.request.format == 'application/json' }

	include HTTParty

	def index
    if params[:id]
      @products = Kaminari.paginate_array(Product.where(id: params[:id]) + Product.where.not(id: params[:id])).page(params[:page]).per(40)
    else
      @products = Kaminari.paginate_array(Product.all).page(params[:page]).per(40)
    end
	end

	def new
		@product = Product.new
    @tags = Tag.all
    @images = Image.new
	end

  def create
    @tags = ""
    params[:product][:producttag_ids].each do |tag|
      if tag.to_i == 0 
        @tags += tag
        @tags += ", "
      else
        @tag = Tag.find(tag.to_i)
        @tags += @tag.name
        @tags += ", "
      end
    end

  	@result = HTTParty.post(Figaro.env.SHOPIFY_ENDPOINT + "products.json",
  	body: {product: {title: params[:product][:title], body_html: params[:product][:body_html], vendor: params[:product][:vendor], tags: @tags} }.to_json,
    headers: { 'Content-Type' => 'application/json' } )

    @product = Product.new(products_params.merge(pid: @result["product"]["id"], vid: @result["product"]["variants"][0]["id"]))
    if @product.save


      if !@product.image.nil? 
        @result2 = HTTParty.post(Figaro.env.SHOPIFY_ENDPOINT + "products/" + @result["product"]["id"].to_s + "/images.json",
        body: {image: {src: "http://tryify.shop" + @product.image_url}}.to_json,
        headers: { 'Content-Type' => 'application/json' } )
      end

      params[:product][:producttag_ids].each do |tag|
        if tag.to_i == 0 
          @tag = Tag.create(name: tag)
          Producttag.create(product_id: @product.id, tag_id: @tag.id)
        else
          Producttag.create(product_id: @product.id, tag_id: tag.to_i)
        end
      end
      redirect_to root_path
    end


  end

  def show


  end


	private

		def products_params
			params.require(:product).permit(:title, :body_html, :vendor, :image)
		end

end
