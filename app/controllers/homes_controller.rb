class HomesController < ApplicationController
  def top
     if params[:keyword]
     @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
     end
  end
  def about
  end
end
