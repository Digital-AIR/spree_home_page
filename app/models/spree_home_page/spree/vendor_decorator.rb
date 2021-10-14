module SpreeHomePage::Spree::VendorDecorator
  def self.prepended(base)
    base.has_one :home_page, class_name: 'Spree::HomePage'
    
  end
end

Spree::Vendor.prepend SpreeHomePage::Spree::VendorDecorator