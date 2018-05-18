class AddStringToUserQuest < ActiveRecord::Migration
  def change
    add_column :userquests, :stringData, :string
  end
end
