module Spree
  module Admin
    class HomePagesController < ResourceController
      before_action :set_home_page, only: [:edit, :update]
      before_action :load_data
      

      # GET /home_pages/1/edit
      def edit
      end

      
      # PATCH/PUT /home_pages/1
      def update
        if permitted_resource_params[:upload_video]
          check_video_content_type(permitted_resource_params[:upload_video])
          @home_page.create_upload_video(attachment: permitted_resource_params.delete(:upload_video))
        end

        if @home_page.update(home_page_params.except(:upload_video))
          redirect_to edit_admin_home_page_path(1), notice: 'Home page was successfully updated.'
        else
          render :edit
        end
      end


      private
        def check_video_content_type(video)
          if video.content_type == "video/mp4"
            thumbnail = Spree::Videos::VideoConverter.new().create_thumbnail!(video.path)
            @home_page.create_thumbnail(attachment: thumbnail)
            @home_page.create_upload_video(attachment: video)          
          else
            converted_video = Spree::Videos::VideoConverter.new().convert!(video.path)
            thumbnail = Spree::Videos::VideoConverter.new().create_thumbnail!(video.path)
            @home_page.create_thumbnail(attachment: thumbnail)
            @home_page.create_upload_video(attachment: converted_video)            
          end
        end
        
        # Use callbacks to share common setup or constraints between actions.
        def set_home_page
          @home_page = HomePage.find(1)
        end

        # Only allow a list of trusted parameters through.
        def home_page_params
          params.require(:home_page).permit(:top_brand_vendor_id, :top_brand_vendor_video_id, :top_brand_vendor_video_review_id,
            :new_arrival_vendor_id, :new_arrival_vendor_video_id, :new_arrival_vendor_video_review_id, :upload_video, product_ids: [], 
            video_product_ids: [], top_product_ids: [] )
        end


        def load_data
          @products = Product.order(:name)       
          @vendors = Vendor.order(:name)
          @top_brand_vendor_videos = Video.order(:name).where(vendor_id: @home_page.top_brand_vendor_id)
          @top_brand_vendor_video_reviews = VideoReview.order(:title).where(video_id: @home_page.top_brand_vendor_video_id)

          @new_arrival_vendor_videos = Video.order(:name).where(vendor_id: @home_page.new_arrival_vendor_id)
          @new_arrival_vendor_video_reviews = VideoReview.order(:title).where(video_id: @home_page.new_arrival_vendor_video_id)

          @new_arrival_vendor_video_product = Product.order(:name).joins(:video_primary_product).where(spree_videos: {id: @home_page.new_arrival_vendor_video_id}) + Product.order(:name).joins(:videos).where(spree_video_secondary_products: {video_id: @home_page.new_arrival_vendor_video_id})

        end

    end
  end
end