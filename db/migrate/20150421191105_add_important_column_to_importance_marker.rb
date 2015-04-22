class AddImportantColumnToImportanceMarker < ActiveRecord::Migration
  def change
    add_column :importance_markers, :important, :boolean
  end
end
