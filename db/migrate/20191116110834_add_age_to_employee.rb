class AddAgeToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :age, :integer
  end
end
