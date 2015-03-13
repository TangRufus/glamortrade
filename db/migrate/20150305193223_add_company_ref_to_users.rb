class AddCompanyRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :company, index: true, null: false
    add_foreign_key :users, :companies
  end
end
