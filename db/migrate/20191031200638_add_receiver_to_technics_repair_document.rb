class AddReceiverToTechnicsRepairDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :technics_repair_documents, :receiver_id, :integer
  end
end
