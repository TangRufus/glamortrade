class ProductForm < ActionForm::Base
  self.main_model = :product

  attributes :name, :description, required: true
  attributes :commission_rate, :ads_budget

  association :variants do
    attributes :name, :minimum_price, :inventory, required: true
    attributes :taobao_sku_id, :your_sku, :commission_rate
  end
end
