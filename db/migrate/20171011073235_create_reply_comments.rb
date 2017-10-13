class CreateReplyComments < ActiveRecord::Migration[5.0]
  def change
    create_table :reply_comments do |t|
      t.integer :user_id, null: false
      t.integer :comment_id, null: false
      t.integer :reply_user_id
      t.text :content, null: false

      t.timestamps
    end
  end
end
