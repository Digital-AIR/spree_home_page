module Spree
  module HomePageVideos
    class QueueRequests
      prepend Spree::ServiceModule::Base

      def call(video_id:, video_name:, content_type:)
        Spree::HomePageVideos::VideoJob.perform_later(video_id, video_name, content_type)
      end

    end
  end
end