# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  unit           :integer          not null
#  amount         :decimal(12, 2)   not null
#  commission_fee :decimal(12, 2)   not null
#  status         :string
#  variant_id     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_orders_on_variant_id  (variant_id)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
