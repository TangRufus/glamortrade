class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :company, index: true, null: false
      t.decimal :amount, null: false, precision: 12, scale: 2, defailt: 0.00
      t.text :description
      t.string :title, null: false

      t.timestamps null: false
    end
    add_foreign_key :bills, :companies
  end
end
