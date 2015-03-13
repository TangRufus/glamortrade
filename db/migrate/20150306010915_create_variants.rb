class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :taobao_sku, index: true
      t.string :your_sku, index: true
      t.decimal :minimum_price, null: false, precision: 12, scale: 2, defailt: 0.00
      t.integer :commission_rate
      t.string :name, null: false
      t.integer :inventory, null: false, default: 0
      t.references :product, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :variants, :products
  end
end
