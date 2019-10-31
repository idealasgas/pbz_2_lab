class AddRepairmanToTechnicsRepairDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :technics_repair_documents, :repair_man_id, :integer
  end
end
