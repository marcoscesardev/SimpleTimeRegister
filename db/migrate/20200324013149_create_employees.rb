class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.boolean :admin
      t.string :name
      t.date :born_day
      t.string :cpf
      t.string :address
      t.string :phone
      t.boolean :is_active

      t.timestamps
    end
  end
end
