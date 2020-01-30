Rails.application.routes.draw do
  get 'view/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #root 'user#login_form'

  #get "/" => "user#login_form"
  get "/" => "web_app#store_list"
  get "web_app/store_info" => "web_app#store_info"
  get "web_app/discount_index" => "web_app#discount_index"
  get "web_app/index" => "web_app#index"
  get "web_app/store_list" => "web_app#store_list"
  get "web_app/search_category" => "web_app#search_category"
  get "web_app/search_category_dis" => "web_app#search_category_dis"
  post "web_app/search_category_dis" => "web_app#search_category_dis"
  post "web_app/search_category" => "web_app#search_category"
  post "web_app/set_store" => "web_app#set_store"
  
  
  
  get "login" => "user#login_form"
  post "login" => "user#login"
  post "logout" => "user#logout"
  
  get "user/edit" => "user#edit"
  get "user/new" => "user#new" 
  get "user/index" => "user#index"
  post "user/destroy" => "user#destroy"
  post "user/update" => "user#update"
  post "user/create" => "user#create"
  # post "user/edit" => "user#edit"
  
  get "product/new" => "product#new"
  get "product/all_index" => "product#all_index"
  get "product/discounts_index" => "product#discounts_index"
  get "product/search" => "product#search"
  get "product/edit" => "product#edit"
  
  post "product/destroy" => "product#destroy"
  post "product/edit" => "product#edit"                                  #postに変更した。
  post "product/update" => "product#update"
  post "product/create" => "product#create"
end
