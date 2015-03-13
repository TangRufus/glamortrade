class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :unit, null: false
      t.decimal :amount, null: false, precision: 12, scale: 2, defailt: 0.00
      t.decimal :commission_fee, null: false, precision: 12, scale: 2, defailt: 0.00
      t.string :status
      t.references :variant, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :orders, :variants
  end
end
