class CreateRepairTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :repair_types, id: false do |t|
      t.string :code, primary_key: true
      t.string :name, null: false
      t.integer :duration, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.text :description, default: ''

      t.timestamps
    end
  end
end
