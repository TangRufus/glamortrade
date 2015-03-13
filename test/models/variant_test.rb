# == Schema Information
#
# Table name: variants
#
#  id              :integer          not null, primary key
#  taobao_sku      :integer
#  your_sku        :string
#  minimum_price   :decimal(12, 2)   not null
#  commission_rate :integer
#  name            :string           not null
#  inventory       :integer          default(0), not null
#  product_id      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_variants_on_product_id  (product_id)
#  index_variants_on_taobao_sku  (taobao_sku)
#  index_variants_on_your_sku    (your_sku)
#

require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
