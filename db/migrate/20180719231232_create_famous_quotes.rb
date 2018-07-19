class CreateFamousQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :famous_quotes do |t|
      t.string :quote
      t.string :actor
      t.integer :movie_id

      t.timestamps
    end
  end
end
