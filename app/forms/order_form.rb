class OrderForm < ActionForm::Base
  self.main_model = :order

  attributes :unit, :amount, :variant_id, required: true
end
