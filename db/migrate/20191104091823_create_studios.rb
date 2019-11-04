class CreateStudios < ActiveRecord::Migration[5.2]
  def change
    create_table :studios do |t|
      t.string :name
      t.string :address
      t.references :hub, foreign_key: true
      t.string :website
      t.string :email
      t.string :phone_number
      t.string :hours
      t.string :styles

      t.timestamps
    end
  end
end
