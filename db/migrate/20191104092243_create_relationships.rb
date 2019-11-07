class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :tag, index: true
      t.references :tagable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
