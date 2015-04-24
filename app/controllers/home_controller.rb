class HomeController < ApplicationController
  def home
    @trending_stories = Story.most_hit(1.day.ago, 15).sort_by {|story| story.importance}.reverse!
    @busy_neighborhoods = Neighborhood.all.sort_by {|neighborhood| neighborhood.stories.count}.reverse![0..4]
    @important_stories = Story.all.sort_by{|story| story.importance}.reverse![0..4]
    @most_viewed_stories = Story.most_hit
  end
end