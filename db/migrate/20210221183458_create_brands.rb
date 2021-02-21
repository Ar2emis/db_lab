class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands, id: false do |t|
      t.string :name, primary_key: true

      t.timestamps
    end
  end
end
