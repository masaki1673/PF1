class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :comic_id
      t.integer :post_coments

      t.timestamps
    end
  end
end
