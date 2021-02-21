class CreateMachineTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :machine_types, id: false do |t|
      t.string :code, primary_key: true
      t.string :country, null: false
      t.integer :manufactured_at, null: false
      t.string :brand_name, index: true, null: false

      t.timestamps
    end

    add_foreign_key(:machine_types, :brands, column: :brand_name, primary_key: :name)
  end
end
