module SpreeHomePage::Spree::VideoReviewDecorator
  def self.prepended(base)
    base.has_one :home_page, class_name: 'Spree::HomePage'
    
  end
end

Spree::VideoReview.prepend SpreeHomePage::Spree::VideoReviewDecorator