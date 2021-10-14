class CreateProductCarousels < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_product_carousels do |t|
      t.references :home_page
      t.references :product
    end

    add_index :spree_product_carousels, [:home_page_id, :product_id], unique: true
  end
end
