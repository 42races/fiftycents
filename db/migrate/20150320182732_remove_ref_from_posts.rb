class RemoveRefFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :ref
  end
end
