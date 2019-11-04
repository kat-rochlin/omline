class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :nationality
      t.text :description
      t.references :hub, foreign_key: true
      t.string :profile_photo
      t.string :cover_photo
      t.boolean :is_teacher

      t.timestamps
    end
  end
end
