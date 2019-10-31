class AddInvoicesToTechnicsRepairDocument < ActiveRecord::Migration[5.2]
  def change
    add_reference :invoices, :technics_repair_document, foreign_key: true
  end
end
