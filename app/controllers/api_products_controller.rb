class ApiProductsController < ApplicationController
  def search
    if params[:keyword]
      @api_products = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end
end
