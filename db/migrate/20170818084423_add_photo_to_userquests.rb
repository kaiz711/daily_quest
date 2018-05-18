class AddPhotoToUserquest < ActiveRecord::Migration
  def change
    add_column :userquests, :photoData, :string
  end
end
