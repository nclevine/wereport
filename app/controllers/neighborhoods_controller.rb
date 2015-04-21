class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all.select {|neighborhood| neighborhood.stories.any?}
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end
end