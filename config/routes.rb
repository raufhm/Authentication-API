# frozen_string_literal: true

Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
    #user_action product_invest
    		get    'prodinvests',         to: 'product_invests#index'
    		get    'prodinvest/:id',      to: 'product_invests#show'
    		post   'prodinvest/create',   to: 'product_invests#create'
    		patch  'prodinvest/:id',      to: 'product_invests#update'
    		delete 'prodinvest/:id',      to: 'product_invests#destroy'

   #user_action product_invest_detail
      	get    'proinvdetails',       to: 'product_invest_details#index'
      	get    'proinvdetail/:id',    to: 'product_invest_details#show'
      	post   'proinvdetail/create', to: 'product_invest_details#create'
      	patch  'proinvdetail/:id',    to: 'product_invest_details#update'
      	delete 'proinvdetail/:id',    to: 'product_invest_details#destroy'

        get 'popularproducts', to: 'popular_products#index'

        post 'password/forgot', to: 'passwords#forgot'
        post 'password/reset', to: 'passwords#reset'
        get    '/users'          => 'users#index'
        get    '/users/current'  => 'users#current'
        post   '/users/create'   => 'users#create'
        patch  '/user/:id'       => 'users#update'
        delete '/user/:id'       => 'users#destroy'
        get    'auth'            => 'home#auth'
        get 'all'                => 'home#all'
        # Get login token from Knock
        post 'user_token' => 'user_token#create'
    end
  end
end 