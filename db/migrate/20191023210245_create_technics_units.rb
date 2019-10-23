class CreateTechnicsUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :technics_units do |t|
      t.string :inventory_number
      t.string :name
      t.string :model
      t.integer :production_year
      t.string :subdivision

      t.timestamps
    end
  end
end
