class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :ref
      t.string :tags, array: true
      t.references :user, index: true
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0

      t.timestamps
    end
  end
end
