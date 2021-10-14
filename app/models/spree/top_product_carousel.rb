module Spree
  class TopProductCarousel < Spree::Base
    belongs_to :home_page, class_name: 'Spree::HomePage'
    belongs_to :top_product, class_name: 'Spree::Product'
  end
end