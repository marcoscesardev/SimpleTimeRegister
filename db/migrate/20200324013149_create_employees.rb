class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.date :born_day
      t.boolean :is_admin, default: false
      t.boolean :is_active, default: false
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :address, null: false
      t.string :phone, null: false

      ## Database authenticatable
      t.string :email, null: false
      t.string :encrypted_password, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end

    add_index :employees, :email, unique: true
  end
end
