module Spree
 module Api
	module V2
	  module Platform
	    class HomePageUploadVideoSerializer < BaseSerializer
	      set_type :upload_video

	      attributes :styles, :original_url

	    end
	  end
	end
  end
end