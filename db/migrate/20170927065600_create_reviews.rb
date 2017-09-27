class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :point
      t.string :title
      t.string :content
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
