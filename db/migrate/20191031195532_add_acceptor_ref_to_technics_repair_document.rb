class AddAcceptorRefToTechnicsRepairDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :technics_repair_documents, :acceptor_id, :integer
  end
end
