class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all.sort_by{|neighborhood| neighborhood.name}
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @stories = Story.where(neighborhood_id:@neighborhood.id)
    @url= "https://maps.google.com/maps/api/staticmap?center=#{@neighborhood.name}+washington+dc&size=450x450&sensor=false&zoom=15&key=#{ENV['my_api_key']}&markers=color:0x009696"
  end
end