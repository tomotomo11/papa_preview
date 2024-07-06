class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :genre_id
      t.string :name, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :price
      t.integer :star, null: false
      t.string :tag
      t.timestamps
    end
  end
end
