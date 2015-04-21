class AddStoryRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :story, index: true, foreign_key: true
  end
end
