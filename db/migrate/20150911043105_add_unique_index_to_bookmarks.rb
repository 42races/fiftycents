class AddUniqueIndexToBookmarks < ActiveRecord::Migration
  def change
    add_index :bookmarks, [:user_id, :post_id], unique: true
  end
end
