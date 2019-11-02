class ChangeAcceptorIdToClientId < ActiveRecord::Migration[5.2]
  def change
    rename_column :technics_repair_documents, :acceptor_id, :client_id
  end
end
