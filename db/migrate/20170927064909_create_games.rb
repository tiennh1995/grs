class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :required
      t.string :info
      t.string :cover
      t.float :point, default: 0

      t.timestamps
    end
  end
end
