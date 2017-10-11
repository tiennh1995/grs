class CreateReplyComments < ActiveRecord::Migration[5.0]
  def change
    create_table :reply_comments do |t|
      t.integer :user_id
      t.integer :comment_id
      t.text :content

      t.timestamps
    end
  end
end
