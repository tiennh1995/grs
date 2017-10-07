class CreateEmotitions < ActiveRecord::Migration[5.0]
  def change
    create_table :emotitions do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.integer :emotition_type, null: false

      t.timestamps
    end
  end
end
