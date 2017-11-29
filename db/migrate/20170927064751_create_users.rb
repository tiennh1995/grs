class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nick_name, null: false
      t.string :avatar
      t.integer :sex, default: 0
      t.boolean :admin, default: false
      t.datetime :birthday, default: DateTime.now
      t.string :avatar_cloud, default: nil
      t.string :provider, default: nil

      t.timestamps
    end
  end
end
