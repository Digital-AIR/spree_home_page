class Spree::HomePage < ActiveRecord::Base
	has_one :top_brand_vendor, class_name: 'Spree::Vendor', primary_key: 'top_brand_vendor_id',  foreign_key: 'id'
	has_one :top_brand_vendor_video, class_name: 'Spree::Video', primary_key: 'top_brand_vendor_video_id',  foreign_key: 'id'
	has_one :top_brand_vendor_video_review, class_name: 'Spree::VideoReview', primary_key: 'top_brand_vendor_video_review_id',  foreign_key: 'id'

	has_one :new_arrival_vendor, class_name: 'Spree::Vendor', primary_key: 'new_arrival_vendor_id',  foreign_key: 'id'
	has_one :new_arrival_vendor_video, class_name: 'Spree::Video', primary_key: 'new_arrival_vendor_video_id',  foreign_key: 'id'
	has_one :new_arrival_vendor_video_review, class_name: 'Spree::VideoReview', primary_key: 'new_arrival_vendor_video_review_id',  foreign_key: 'id'

    has_one :upload_video, as: :viewable, dependent: :destroy, class_name: 'Spree::HomePageUploadVideo'
    validates_associated :upload_video

    has_many :product_carousels, class_name: 'Spree::ProductCarousel'
    has_many :products, through: :product_carousels, class_name: 'Spree::Product'

    has_many :video_product_carousels, class_name: 'Spree::VideoProductCarousel'
    has_many :video_products, through: :video_product_carousels, class_name: 'Spree::Product'

    has_many :top_product_carousels, class_name: 'Spree::TopProductCarousel'
    has_many :top_products, through: :top_product_carousels, class_name: 'Spree::Product'

end

