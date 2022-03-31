class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|

      t.datetime :date
      t.string :latitude
      t.string :longitude
      t.references :animal, foreign_key: true

      t.timestamps
    end
  end
end
