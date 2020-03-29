class CreateTimeRegisters < ActiveRecord::Migration[6.0]
  def change
    create_table :time_registers do |t|
      t.references :employee, index: true, foreign_key: true, null: false
      t.references :registered_by, index: true, foreign_key: true, null: false, foreign_key: { to_table: :employees }
      t.datetime :registered_at, null: false
      t.text :justification

      t.timestamps
    end
  end
end
