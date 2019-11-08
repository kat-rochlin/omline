class RenameColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :profile_photo, :profilephoto
    rename_column :users, :cover_photo, :coverphoto
  end
end
