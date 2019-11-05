class AddLocationNameToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :location_name, :string
  end
end
