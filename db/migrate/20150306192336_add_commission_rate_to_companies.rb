class AddCommissionRateToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :commission_rate, :integer
  end
end
