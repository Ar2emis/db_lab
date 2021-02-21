class CreateRepairs < ActiveRecord::Migration[6.0]
  def change
    create_table :repairs do |t|
      t.string :machine_type_code, index: true, null: false
      t.string :repair_type_code, index: true, null: false
      t.date :started_at, null: false
      t.text :description, default: ''

      t.timestamps
    end

    add_foreign_key(:repairs, :machine_types, column: :machine_type_code, primary_key: :code)
    add_foreign_key(:repairs, :repair_types, column: :repair_type_code, primary_key: :code)
  end
end
