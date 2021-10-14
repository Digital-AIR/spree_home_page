class CreateHomePages < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_home_pages do |t|
      t.references :top_brand_vendor, foreign_key: { to_table: 'spree_vendors' }      
      t.references :top_brand_vendor_video, foreign_key: { to_table: 'spree_videos' }      
      t.references :top_brand_vendor_video_review, foreign_key: { to_table: 'spree_video_reviews' }      
      
      t.references :new_arrival_vendor, foreign_key: { to_table: 'spree_vendors' }
      t.references :new_arrival_vendor_video, foreign_key: { to_table: 'spree_videos' }      
      t.references :new_arrival_vendor_video_review, foreign_key: { to_table: 'spree_video_reviews' }
            

      t.timestamps
    end
  end
end
