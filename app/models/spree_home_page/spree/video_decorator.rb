module SpreeHomePage::Spree::VideoDecorator
  def self.prepended(base)
    base.has_one :home_page, class_name: 'Spree::HomePage'
    
  end
end

Spree::Video.prepend SpreeHomePage::Spree::VideoDecorator