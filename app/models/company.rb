# == Schema Information
#
# Table name: companies
#
#  id                      :integer          not null, primary key
#  name                    :string           not null
#  email_host              :string           not null
#  inventory_contact_email :string           not null
#  commission_rate         :integer          default(10), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Company < ActiveRecord::Base
  before_save :downcase_attributes
  auto_strip_attributes :name, squish: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email_host, presence: true, uniqueness: { case_sensitive: false }, root_domain: true
  validates :inventory_contact_email, presence: true, email: true
  validates :commission_rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  has_many :users
  has_many :bills
  has_many :products
  has_many :variants, through: :products
  has_many :orders, through: :variants

  private
  def downcase_attributes
    self.email_host.downcase! unless self.email_host.blank?
    self.inventory_contact_email.downcase! unless self.inventory_contact_email.blank?
  end
end
