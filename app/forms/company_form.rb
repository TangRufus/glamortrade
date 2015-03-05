class CompanyForm < ActionForm::Base
  self.main_model = :company

  attributes :name, :domain_url, :low_stock_contact_email, :out_of_stock_contact_email, :delivery_contact_email, required: true
end
