class AddCommissionChargeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :commission_charge, :integer, null: false
  end
end
