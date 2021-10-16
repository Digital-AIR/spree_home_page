module Spree
    module Admin
        class FilterforhomepageController < ActionController::API

            def filtervideosbytopbrandvendor
                @top_brand_vendor_videos = Video.order(:name).where(vendor_id: params["vendor_id"].presence)
                render json: @top_brand_vendor_videos
              end

            def filterreviewsbytopbrandvendorvideo
                @top_brand_vendor_video_reviews = VideoReview.order(:title).where(video_id: params["video_id"].presence)
                render json: @top_brand_vendor_video_reviews
            end

            def filtervideosbynewarrivalvendor
                @new_arrival_vendor_videos = Video.order(:name).where(vendor_id: params["vendor_id"].presence)
                render json: @new_arrival_vendor_videos
            end

            def filterreviewsbynewarrivalvendorvideo
                @new_arrival_vendor_video_reviews = VideoReview.order(:title).where(video_id: params["video_id"].presence)
                render json: @new_arrival_vendor_video_reviews
            end

            def filterproductbynewarrivalvendorvideo

            	@new_arrival_vendor_video_product = Product.order(:name).joins(:video_primary_product).where(spree_videos: {id: params["video_id"].presence}) + Product.order(:name).joins(:videos).where(spree_video_secondary_products: {video_id: params["video_id"].presence})
                render json: @new_arrival_vendor_video_product
            end
        
        end
    end
end