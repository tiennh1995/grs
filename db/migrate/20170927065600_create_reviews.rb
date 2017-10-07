class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :game_id, null: false
      t.integer :point
      t.string :title, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
