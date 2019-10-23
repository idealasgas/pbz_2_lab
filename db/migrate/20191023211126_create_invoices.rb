class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.timestamp :reception_date
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
