class AddTagToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :tag, :boolean, default: false
  end
end
