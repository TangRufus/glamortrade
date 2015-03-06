class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description
      t.integer :commission_rate
      t.string :name, null: false
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :companies
  end
end
