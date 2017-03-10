class ProductsController < ApplicationController
  def create
  	
  end


  private 

	def products_params
		params.require(:product).permit(:pid)
	end

end
