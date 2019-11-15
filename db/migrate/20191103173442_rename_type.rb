class RenameType < ActiveRecord::Migration[5.2]
  def change
    rename_column :technics_repair_documents, :type, :repare_type
  end
end
