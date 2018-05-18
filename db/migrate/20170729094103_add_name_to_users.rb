class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile_img, :string, default: "photo.jpg"
  end
end
