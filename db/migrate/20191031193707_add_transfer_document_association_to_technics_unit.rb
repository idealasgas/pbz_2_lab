class AddTransferDocumentAssociationToTechnicsUnit < ActiveRecord::Migration[5.2]
  def change
    add_reference :transfer_documents, :technics_unit, foreign_key: true
  end
end
