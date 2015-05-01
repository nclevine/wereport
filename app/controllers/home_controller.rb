class HomeController < ApplicationController
  def home
    # I would move these methods into the respective models. e.g.:
    # @trending_stories = Story.trending(15)
    # @busy_neighborhoods = Neighborhood.busy(4)
    # @important_stories = Story.most_important(4)
    # The idea is to reveal as little information about the models to other
    # parts of your code (i.e. this controller code here)
    @trending_stories = Story.most_hit(1.day.ago, 15).sort_by {|story| story.importance}.reverse!
    @busy_neighborhoods = Neighborhood.all.sort_by {|neighborhood| neighborhood.stories.count}.reverse![0..4]
    @important_stories = Story.all.sort_by{|story| story.importance}.reverse![0..4]
    @most_viewed_stories = Story.most_hit
  end
end
