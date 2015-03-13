class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.integer :commission_rate
      t.integer :ads_budget, null: false, default: 0
      t.references :company, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :products, :companies
  end
end
