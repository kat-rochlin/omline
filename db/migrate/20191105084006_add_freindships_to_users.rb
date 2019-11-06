class AddFreindshipsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :friendship, foreign_key: true
  end
end
