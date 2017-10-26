class CreateLinkComments < ActiveRecord::Migration[5.1]
  def change
    create_table :link_comments do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :link_id

      t.timestamps
    end
  end
end
