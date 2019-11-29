class AddSubdivisionToTechnicsUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :technics_units, :subdivision_id, :integer
  end
end
