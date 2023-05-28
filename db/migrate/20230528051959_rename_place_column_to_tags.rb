class RenamePlaceColumnToTags < ActiveRecord::Migration[7.0]
  def change
    rename_column :tags, :place, :situation
  end
end
