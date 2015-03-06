class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :unit, null: false
      t.integer :amount, null: false
      t.references :variant, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :variants
  end
end
