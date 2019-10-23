class CreateTransferDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :transfer_documents do |t|
      t.timestamp :start_date
      t.string :subdivision
      t.timestamp :finish_date

      t.timestamps
    end
  end
end
