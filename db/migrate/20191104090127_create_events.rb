class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :hub, foreign_key: true
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :address
      t.integer :capacity
      t.string :photo
      t.float :price

      t.timestamps
    end
  end
end
