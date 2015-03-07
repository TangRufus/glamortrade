class AddAdsBudgetToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ads_budget, :integer
  end
end
