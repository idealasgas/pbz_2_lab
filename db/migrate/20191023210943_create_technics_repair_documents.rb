class CreateTechnicsRepairDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :technics_repair_documents do |t|
      t.timestamp :start_date
      t.string :type
      t.integer :term

      t.timestamps
    end
  end
end
