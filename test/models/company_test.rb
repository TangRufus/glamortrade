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

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
