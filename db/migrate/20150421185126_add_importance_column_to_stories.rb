class AddImportanceColumnToStories < ActiveRecord::Migration
  def change
    add_column :stories, :importance, :integer, default: 0
  end
end
