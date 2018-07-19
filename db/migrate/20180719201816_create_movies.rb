class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.integer :length
      t.string :lead_actor
      t.boolean :available
      t.integer :customer_id

      t.timestamps
    end
  end
end
