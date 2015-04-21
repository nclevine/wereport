class AddNeighborhoodRefToStory < ActiveRecord::Migration
  def change
    add_reference :stories, :neighborhood, index: true, foreign_key: true
  end
end
