class CreateScreenshots < ActiveRecord::Migration[5.0]
  def change
    create_table :screenshots do |t|
      t.integer :game_id
      t.string :image

      t.timestamps
    end
  end
end
