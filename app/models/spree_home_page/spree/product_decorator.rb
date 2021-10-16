module SpreeHomePage::Spree::ProductDecorator
  def self.prepended(base)
    
    base.has_many :video_product_carousels, class_name: 'Spree::VideoProductCarousel'
	base.has_many :home_pages, through: :video_product_carousels, class_name: 'Spree::HomePage'

	base.has_many :top_product_carousels, class_name: 'Spree::TopProductCarousel'
	base.has_many :home_pages, through: :top_product_carousels, class_name: 'Spree::HomePage'
     
  end
end

Spree::Product.prepend SpreeHomePage::Spree::ProductDecorator