class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nick_name
      t.string :avatar
      t.integer :sex, default: 0
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
