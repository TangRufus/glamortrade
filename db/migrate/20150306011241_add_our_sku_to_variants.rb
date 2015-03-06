class AddOurSkuToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :our_sku, :string
    add_index :variants, :our_sku
  end
end
