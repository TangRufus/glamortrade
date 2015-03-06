class BillForm < ActionForm::Base
  self.main_model = :bill

  attributes :company_id, :amount, :title, required: true
  attributes :description
end
