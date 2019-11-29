class CreateSubdivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :subdivisions do |t|
      t.string :name

      t.timestamps
    end
  end
end
