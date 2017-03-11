class ProductSearchController < ApplicationController
  skip_before_filter :verify_authenticity_token
                     #:if => Proc.new { |c| c.request.format == 'application/json' }


  # include Serializers::V1::ItemsSerializer

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  def search
      @products = []
      if params[:key].present? 
          @products =Product.where("lower(title) LIKE lower(?)", "%#{params[:key]}%" )
      end      
        
    if @products.count == 0
      render :status => 200,
        :json => { :products => @products, :message =>"Product not found" }
    else
      render :status => 200,
         :json => { :products => @products }
        
#        respond_to do |format|
#            format.js
#        end
    end
    
  end

end