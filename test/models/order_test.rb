# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  unit              :integer          not null
#  amount            :integer          not null
#  variant_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  commission_charge :integer          not null
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
