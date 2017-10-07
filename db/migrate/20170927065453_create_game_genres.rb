class CreateGameGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :game_genres do |t|
      t.integer :game_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
