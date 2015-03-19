# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  description     :text
#  commission_rate :integer
#  ads_budget      :integer          default(0), not null
#  company_id      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_products_on_company_id  (company_id)
#

class Product < ActiveRecord::Base
  auto_strip_attributes :name, :description, squish: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :commission_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
  validates :ads_budget, numericality: true, presence: true

  ## TODO
  # validates_associated :company

  belongs_to :company
  has_many :variants
  has_many :orders, through: :variants

  def all_time_sale_unit
    orders.sum("unit")
  end

  def all_time_sale_income
    orders.sum("amount")
  end

  def last_30_days_sale_unit
    os = orders.select { |o| o.created_at > (Time.now-30.days) }
    os.sum(&:unit)
  end

  def last_30_days_sale_income
    os = orders.select { |o| o.created_at > (Time.now-30.days) }
    os.sum(&:amount)
  end

  def last_7_days_sale_unit
    os = orders.select { |o| o.created_at > (Time.now-7.days) }
    os.sum(&:unit)
  end

  def last_7_days_sale_income
    os = orders.select { |o| o.created_at > (Time.now-7.days) }
    os.sum(&:amount)
  end

  private
  def sale_unit
    self.order.where()
  end
end
