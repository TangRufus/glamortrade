# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  description     :text
#  commission_rate :integer
#  name            :string           not null
#  company_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_products_on_company_id  (company_id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
