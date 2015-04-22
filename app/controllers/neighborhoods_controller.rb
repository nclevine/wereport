class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all.sort_by{|neighborhood| neighborhood.name}
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end
end