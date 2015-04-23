class RemoveNameFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :name, :string
  end
end
