class DropSubdivisions < ActiveRecord::Migration[5.2]
  def change
    drop_table :subdivisions
  end
end
