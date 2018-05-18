class AddContentToUserQuest < ActiveRecord::Migration
  def change
    add_column :userquests, :feel, :text
    add_column :userquests, :data, :string
  end
end
