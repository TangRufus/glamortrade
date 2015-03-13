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

require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
