module Spree
  class HomePageUploadVideo < Asset
    module Configuration
      module ActiveStorage
        extend ActiveSupport::Concern

        included do

          validates :attachment, attached: true, content_type: /\Avideo\/.*\z/

          has_one_attached :attachment

          default_scope { includes(attachment_attachment: :blob) }

          def self.styles
            @styles ||= {
              mini: '32x32>',
              normal: '128x128>'
            }
          end

          def default_style
            :mini
          end

        end
      end
    end
  end
end