class AddPhotoToStudios < ActiveRecord::Migration[5.2]
  def change
    add_column :studios, :photo, :string
  end
end
