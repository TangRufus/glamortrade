class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :your_sku
      t.integer :minimum_price, null: false
      t.integer :commission_rate
      t.string :name, null: false
      t.references :product, index: true
      t.integer :inventory, null: false

      t.timestamps null: false
    end
    add_foreign_key :variants, :products
  end
end
