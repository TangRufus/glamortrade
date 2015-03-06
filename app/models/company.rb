# == Schema Information
#
# Table name: companies
#
#  id                         :integer          not null, primary key
#  name                       :string           not null
#  domain_url                 :string           not null
#  low_stock_contact_email    :string
#  out_of_stock_contact_email :string
#  delivery_contact_email     :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class Company < ActiveRecord::Base
  auto_strip_attributes :name, :squish => true

  validates :name, presence: true, uniqueness: true
  validates :domain_url, presence: true, uniqueness: true, :url => {:no_local => true}
  validates :low_stock_contact_email, presence: true, :email => true
  validates :out_of_stock_contact_email, presence: true, :email => true
  validates :delivery_contact_email, presence: true, :email => true

  has_many :users
  has_many :products

  def self.domains
    companies = Company.all
    companies.collect { |c| Addressable::URI.parse(c.domain_url).host }
  end

  def self.find_by_doamin_host domain_host
    companies = Company.all
    companies.detect { |c| Addressable::URI.parse(c.domain_url).host == domain_host }
  end
end
