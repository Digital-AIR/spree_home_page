class CreateTopProductCarousels < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_top_product_carousels do |t|
	  t.references :home_page
      t.references :top_product, foreign_key: { to_table: 'spree_products' }
    end

    add_index :spree_top_product_carousels, [:home_page_id, :top_product_id], unique: true, name: :top_product_carousels
  end
end

