class Api::V1::TagsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }


  # include Serializers::V1::ItemsSerializer

  # Just skip the authentication for now
  # before_filter :authenticate_user!


  def search
    @tags = Tag.where("lower(name) LIKE lower(?)", "%#{params[:key]}%" )
    if @tags.count == 0
      render :status => 200,
             :json => { :tags => [{id: params[:key], name: "Add new tag"}] }
    else
      render :status => 200,
             :json => { :tags => @tags }
    end
    
  end


end
