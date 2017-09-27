class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nick_name
      t.string :email
      t.string :password
      t.string :avatar
      t.boolean :admin

      t.timestamps
    end
  end
end
