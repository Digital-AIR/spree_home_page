module Spree
    module Admin
        class FilterforhomepageController < ActionController::API

            def filtervideosbyvendor
                @top_brand_vendor_videos = Video.order(:name).where(vendor_id: params["vendor_id"].presence)
                render json: @top_brand_vendor_videos
              end
        
        end
    end
end