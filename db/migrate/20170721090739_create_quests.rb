class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :theme
      t.string :content
      t.text :description
      t.text :howTo
      t.string :time


      t.timestamps null: false
    end
  end
end
