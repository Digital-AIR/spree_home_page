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
          @home_page.create_upload_video(attachment: permitted_resource_params[:upload_video])
          IO.copy_stream(permitted_resource_params[:upload_video].path, 'tmp/' + permitted_resource_params[:upload_video].original_filename.to_s)
          HomePageVideoWorker.perform_async(@home_page.id, permitted_resource_params[:upload_video].original_filename.to_s, permitted_resource_params[:upload_video].content_type.to_s)
        end

        if @home_page.update(home_page_params.except(:upload_video))
          redirect_to edit_admin_home_page_path(1), notice: 'Home page was successfully updated.'
        else
          render :edit
        end
      end


      private        
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