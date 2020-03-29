class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.date :born_day
      t.boolean :is_admin, default: false
      t.boolean :is_active, default: true
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :address, null: false
      t.string :phone, null: false

      ## Database authenticatable
      t.string :email, null: false
      t.string :encrypted_password, null: false

      t.timestamps null: false
    end

    add_index :employees, :email, unique: true
    add_index :employees, :cpf, unique: true
  end
end
