class AddTechnicsRepairDocumentAssociationToTechnicsUnit < ActiveRecord::Migration[5.2]
  def change
    add_reference :technics_repair_documents, :technics_unit, foreign_key: true
  end
end
