module Spree
  module HomePageVideos
    class GenerateVideoThumbnail
      prepend Spree::ServiceModule::Base

      def call(video_id:, video_url: nil, screenshot_time:, video_name:nil)
        if video_url.nil?
          movie = FFMPEG::Movie.new('tmp/'+ video_name.to_s)
        else          
          movie = FFMPEG::Movie.new(video_url)
        end
        @home_page = Spree::HomePage.find(video_id)         
        thumbnail_path = "tmp/thumbnail-#{SecureRandom.alphanumeric(12)}.jpg"
        movie.screenshot(thumbnail_path,  seek_time: screenshot_time)
        thumbnail = {io: File.open(thumbnail_path), filename: "thumbnail-#{SecureRandom.alphanumeric(12)}.jpg", content_type: 'image/jpg'}
        @home_page.create_thumbnail(attachment: thumbnail)
        File.delete(thumbnail_path)
      end
    end
  end
end