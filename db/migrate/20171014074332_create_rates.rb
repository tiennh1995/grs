class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :user_id, null: false
      t.integer :game_id, null: false
      t.integer :point, null: false

      t.timestamps
    end
  end
end
