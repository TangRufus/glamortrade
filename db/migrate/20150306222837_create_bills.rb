class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :company, index: true, null: false
      t.integer :amount, null: false
      t.text :description, null: false
      t.string :title, null: false

      t.timestamps null: false
    end
    add_foreign_key :bills, :companies
  end
end
