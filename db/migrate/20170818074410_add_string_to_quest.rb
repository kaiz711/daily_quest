class AddStringToQuest < ActiveRecord::Migration
  def change
    add_column :quests, :stringData, :string
  end
end
