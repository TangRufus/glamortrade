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

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
