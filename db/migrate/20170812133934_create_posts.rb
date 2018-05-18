class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :quest_id
      t.string :title
      t.text :content
      t.string :theme
      t.string :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
