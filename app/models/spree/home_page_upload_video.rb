module Spree
  class HomePageUploadVideo < Asset
    include Configuration::ActiveStorage
    include Rails.application.routes.url_helpers

    def styles
      self.class.styles.map do |_, size|
        width, height = size[/(\d+)x(\d+)/].split('x')

        {
          url: polymorphic_path(attachment, only_path: true),
          width: width,
          height: height
        }
      end
    end

    def original_url
      rails_blob_path(attachment, disposition: "inline", only_path: true)
    end
  end
end