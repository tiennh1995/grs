class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :game_name, null: false
      t.string :genre_info, null: false
      t.string :required
      t.string :info
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
