class AddNamesToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :names, :text, array: true, default: []
  end
end
