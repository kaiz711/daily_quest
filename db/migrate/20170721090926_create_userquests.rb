class CreateUserquests < ActiveRecord::Migration
  def change
    create_table :userquests do |t|
      t.references :user, index: true, foreign_key: true
      t.references :quest, index: true, foreign_key: true
      t.integer :success
      t.timestamps null: false
    end
  end
end
