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

class Variant < ActiveRecord::Base
  auto_strip_attributes :name, squish: true
  auto_strip_attributes :your_sku, delete_whitespaces: true

  validates :your_sku, uniqueness: { case_sensitive: false }, allow_nil: true
  validates :minimum_price, presence: true, numericality: { greater_than: 0 }
  validates :commission_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :inventory, numericality: { only_integer: true }, presence: true
  validates :product, presence: true
  validates_associated :product

  belongs_to :product
  has_many :orders
end
