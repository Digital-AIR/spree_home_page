module Spree
  module Api
    module V2
      module Storefront
        class HomePageController < ::Spree::Api::V2::BaseController
          include Spree::Api::V2::CollectionOptionsHelpers

          def index
            home_pages = HomePage.find(1)
            render_serialized_payload { serialize_resource(home_pages) }
          end

          private

          def resource_serializer
            Spree::V2::Storefront::HomePageSerializer
          end

        end
      end
    end
  end
end