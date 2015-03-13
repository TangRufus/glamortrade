class CompanyForm < ActionForm::Base
  self.main_model = :company

  attributes :name, :email_host, :inventory_contact_email, :commission_rate, required: true
end
