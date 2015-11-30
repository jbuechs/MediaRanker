class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :description
      t.integer :upvotes

      t.timestamps null: false
    end
  end
end
