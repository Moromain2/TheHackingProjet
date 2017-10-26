class CreateCommentComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_comments do |t|
      t.text :title
      t.text :content
      t.integer :user_id
      t.integer :link_id
      t.integer :link_comment_id

      t.timestamps
    end
  end
end
