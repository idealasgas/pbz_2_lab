class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.timestamp :start_date
      t.timestamp :finish_date
      t.string :subdivision
      t.integer :sex
      t.string :position
      t.string :name
      t.string :last_name
      t.string :middle_name

      t.timestamps
    end
  end
end
