# == Schema Information
#
# Table name: bills
#
#  id          :integer          not null, primary key
#  company_id  :integer          not null
#  amount      :decimal(12, 2)   not null
#  description :text
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_bills_on_company_id  (company_id)
#

class Bill < ActiveRecord::Base
  auto_strip_attributes :title, :description, squish: true

  validates :company, presence: true
  validates_associated :company
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :company

  def self.total_amount company
    bills = Bill.where(company: company)
    bills.sum("amount")
  end
end
