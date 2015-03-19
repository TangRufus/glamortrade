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

class Order < ActiveRecord::Base
  before_validation :calculate_commission
  before_validation :set_status
  after_create :reduce_inventory

  validates :unit, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :amount, presence: true, numericality: true

  validates :variant, presence: true
  validates_associated :variant

  belongs_to :variant

  delegate :product, to: :variant
  delegate :company, to: :product

  def self.total_amount company
    orders = company.orders
    orders.sum("amount")
  end


  def self.total_commission_fee company
    orders = company.orders
    orders.sum("commission_fee")
  end

  def set_status
    self.status ||= "Completed"
  end

  def calculate_commission
    self.commission_fee = amount * commission_rate / 100
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
