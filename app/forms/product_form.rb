class ProductForm < ActionForm::Base
  self.main_model = :product

  attributes :name, :description, required: true
  attributes :commission_rate

  association :variants do
    attributes :name, :minimum_price, :inventory, required: true
    attributes :our_sku, :your_sku, :commission_rate
  end
end
