class AddConditionToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :condition, :string
    add_column :quests, :needs, :string
    add_column :quests, :explain, :string
  end
end
