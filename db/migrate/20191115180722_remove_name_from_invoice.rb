class RemoveNameFromInvoice < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :name
  end
end
