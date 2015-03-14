class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :phone_no
      t.date :dob
      t.string :place
      t.string :country

      t.timestamps
    end
  end
end
