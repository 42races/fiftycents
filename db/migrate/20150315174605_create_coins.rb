class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.string :name
      t.integer :year
      t.text :description
      t.string :material
      t.integer :thickness
      t.integer :diameter
      t.string :country
      t.integer :weight
      t.string :mint
      t.string :spape
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
