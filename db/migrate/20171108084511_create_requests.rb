class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false
      t.string :game_name, null: false
      t.string :genre_info, null: false
      t.integer :status, default: 0
      t.string :required
      t.string :info
      t.string :reason

      t.timestamps
    end
  end
end
