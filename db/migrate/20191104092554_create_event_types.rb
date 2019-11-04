class CreateEventTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :event_types do |t|
      t.references :event, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
