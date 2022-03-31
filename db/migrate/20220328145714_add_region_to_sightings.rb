class AddRegionToSightings < ActiveRecord::Migration[5.2]
  def change
    add_column :sightings, :region, :string
  end
end
