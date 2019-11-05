class AddCoverPhotoToHubs < ActiveRecord::Migration[5.2]
  def change
    add_column :hubs, :cover_photo, :string
  end
end
