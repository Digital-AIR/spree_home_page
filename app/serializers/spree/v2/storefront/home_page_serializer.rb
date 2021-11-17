module Spree
  module V2
    module Storefront
      class HomePageSerializer < BaseSerializer
        set_type :home_page

        has_one :top_brand_vendor, serializer: :vendor
        has_one :top_brand_vendor_video, serializer: :video
        has_one :top_brand_vendor_video_review, serializer: :video_review
        has_one :new_arrival_vendor, serializer: :vendor
        has_one :new_arrival_vendor_video, serializer: :video
        has_one :new_arrival_vendor_video_review, serializer: :video_review
        has_one :upload_video, serializer: :upload_video
        has_one :thumbnail, serializer: :thumbnail
        has_many :video_products, serializer: :product
        has_many :top_products, serializer: :product
      end
    end
  end
end