class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.string :tag_type
      t.references :tagable, polymorphic: true

      t.timestamps
    end
  end
end