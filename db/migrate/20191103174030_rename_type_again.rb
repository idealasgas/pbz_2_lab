class RenameTypeAgain < ActiveRecord::Migration[5.2]
  def change
    rename_column :technics_repair_documents, :repare_type, :repair_type
  end
end
