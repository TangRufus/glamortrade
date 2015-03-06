# == Schema Information
#
# Table name: bills
#
#  id          :integer          not null, primary key
#  company_id  :integer          not null
#  amount      :integer          not null
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_bills_on_company_id  (company_id)
#

class Bill < ActiveRecord::Base
  belongs_to :company
end
