class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :picture_id

      t.timestamps
    end
  end
end
