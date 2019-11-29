class AddSubdivisionToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :subdivision_id, :integer
  end
end
