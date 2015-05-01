class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all.sort_by{|neighborhood| neighborhood.name}
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    # This is better written as below, since Neighboorhood has_many :stories
  # @stories = @neighborhood.stories
    @stories = Story.where(neighborhood_id:@neighborhood.id)
    # I'd choose a more descriptive variable name, i.e. @map_url or @static_map_url
    @url= "https://maps.google.com/maps/api/staticmap?center=#{@neighborhood.name}+washington+dc&size=450x450&sensor=false&zoom=14&key=#{ENV['google_maps_key']}&markers=color:0x009696"
  end
end
