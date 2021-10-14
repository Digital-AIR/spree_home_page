module Spree
  class ProductCarousel < Spree::Base
    belongs_to :home_page, class_name: 'Spree::HomePage'
    belongs_to :product, class_name: 'Spree::Product'
  end
end