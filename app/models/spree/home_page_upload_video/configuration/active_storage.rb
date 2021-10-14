module Spree
  class HomePageUploadVideo < Asset
    module Configuration
      module ActiveStorage
        extend ActiveSupport::Concern

        included do
          validate :check_attachment_content_type

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

          def accepted_video_types
            %w(video/mp4 video/mov)
          end

          def check_attachment_content_type
            if attachment.attached? && !attachment.content_type.in?(accepted_video_types)
              errors.add(:attachment, :not_allowed_content_type)
            end
          end
        end
      end
    end
  end
end