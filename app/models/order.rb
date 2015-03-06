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

class Order < ActiveRecord::Base
  before_validation :calculate_commission
  after_create :reduce_inventory

  validates :unit, presence: true, numericality: { only_integer: true }
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :variant_id, presence: true, numericality: { only_integer: true }

  belongs_to :variant

  delegate :product, to: :variant
  delegate :company, to: :product

  def calculate_commission
    self.commission_charge = amount * commission_rate / 100
  end

  def reduce_inventory
    variant.inventory -= unit
    variant.save!
  end

  private
  def commission_rate
    variant.commission_rate || product.commission_rate || company.commission_rate
  end
end
