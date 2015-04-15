class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user, index: true
      t.references :post, index: true
      t.timestamps
    end
  end
end
