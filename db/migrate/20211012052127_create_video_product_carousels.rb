class CreateVideoProductCarousels < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_video_product_carousels do |t|
      t.references :home_page
      t.references :video_product, foreign_key: { to_table: 'spree_products' }
    end

    add_index :spree_video_product_carousels, [:home_page_id, :video_product_id], unique: true, name: :video_product_carousels
  end
end
