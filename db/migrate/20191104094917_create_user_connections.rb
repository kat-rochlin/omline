class CreateUserConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :user_connections do |t|
      t.references :connectee, foreign_key: { to_table: 'users' }
      t.references :connector, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
