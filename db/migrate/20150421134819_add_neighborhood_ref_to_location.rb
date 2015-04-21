class AddNeighborhoodRefToLocation < ActiveRecord::Migration
  def change
    add_reference :locations, :neighborhood, index: true, foreign_key: true
  end
end
