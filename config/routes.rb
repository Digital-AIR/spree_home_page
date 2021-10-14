Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
  	resources :home_pages, only: [:edit, :update]
    get 'filter_videos_by_vendor' => 'home_pages#filter_videos_by_vendor'
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
  	  namespace :storefront do
  	  	resources :home_page, only: [:index]
  	  end
  	end
  end				
  
end
