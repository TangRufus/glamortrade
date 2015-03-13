class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :email_host, null: false
      t.string :inventory_contact_email, null: false
      t.integer :commission_rate, null: false, default: 10

      t.timestamps null: false
    end
  end
end
