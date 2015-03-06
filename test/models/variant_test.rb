# == Schema Information
#
# Table name: variants
#
#  id              :integer          not null, primary key
#  your_sku        :string
#  minimum_price   :integer          not null
#  commission_rate :integer
#  name            :string           not null
#  product_id      :integer
#  inventory       :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  our_sku         :string
#
# Indexes
#
#  index_variants_on_our_sku     (our_sku)
#  index_variants_on_product_id  (product_id)
#

require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
