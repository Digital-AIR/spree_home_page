Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
  	resources :home_pages, only: [:edit, :update]

    get 'filtervideosbytopbrandvendor' => 'filterforhomepage#filtervideosbytopbrandvendor'
    get 'filterreviewsbytopbrandvendorvideo' => 'filterforhomepage#filterreviewsbytopbrandvendorvideo'
    get 'filtervideosbynewarrivalvendor' => 'filterforhomepage#filtervideosbynewarrivalvendor'
    get 'filterreviewsbynewarrivalvendorvideo' => 'filterforhomepage#filterreviewsbynewarrivalvendorvideo'
    get 'filterproductbynewarrivalvendorvideo' => 'filterforhomepage#filterproductbynewarrivalvendorvideo'
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
  	  namespace :storefront do
  	  	resources :home_page, only: [:index]
  	  end
  	end
  end				
  
end
