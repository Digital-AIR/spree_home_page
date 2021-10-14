module Spree
  class VideoProductCarousel < Spree::Base
    belongs_to :home_page, class_name: 'Spree::HomePage'
    belongs_to :video_product, class_name: 'Spree::Product'
  end
end