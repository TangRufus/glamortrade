class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :domain_url, null: false
      t.string :low_stock_contact_email
      t.string :out_of_stock_contact_email
      t.string :delivery_contact_email

      t.timestamps null: false
    end
  end
end
