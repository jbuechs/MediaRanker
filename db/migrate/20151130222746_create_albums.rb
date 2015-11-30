class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :description
      t.integer :upvotes

      t.timestamps null: false
    end
  end
end
