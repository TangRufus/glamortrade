# == Route Map
#
#                    Prefix Verb   URI Pattern                       Controller#Action
#                     bills GET    /bills(.:format)                  bills#index
#                           POST   /bills(.:format)                  bills#create
#                  new_bill GET    /bills/new(.:format)              bills#new
#                 edit_bill GET    /bills/:id/edit(.:format)         bills#edit
#                      bill PATCH  /bills/:id(.:format)              bills#update
#                           PUT    /bills/:id(.:format)              bills#update
#                    orders GET    /orders(.:format)                 orders#index
#                           POST   /orders(.:format)                 orders#create
#                 new_order GET    /orders/new(.:format)             orders#new
#                 companies GET    /companies(.:format)              companies#index
#                           POST   /companies(.:format)              companies#create
#               new_company GET    /companies/new(.:format)          companies#new
#              edit_company GET    /companies/:id/edit(.:format)     companies#edit
#                   company GET    /companies/:id(.:format)          companies#show
#                           PATCH  /companies/:id(.:format)          companies#update
#                           PUT    /companies/:id(.:format)          companies#update
#                           DELETE /companies/:id(.:format)          companies#destroy
#                  products GET    /products(.:format)               products#index
#                           POST   /products(.:format)               products#create
#               new_product GET    /products/new(.:format)           products#new
#              edit_product GET    /products/:id/edit(.:format)      products#edit
#                   product GET    /products/:id(.:format)           products#show
#                           PATCH  /products/:id(.:format)           products#update
#                           PUT    /products/:id(.:format)           products#update
#                           DELETE /products/:id(.:format)           products#destroy
#         new_admin_session GET    /admins/sign_in(.:format)         devise/sessions#new
#             admin_session POST   /admins/sign_in(.:format)         devise/sessions#create
#     destroy_admin_session DELETE /admins/sign_out(.:format)        devise/sessions#destroy
#            admin_password POST   /admins/password(.:format)        devise/passwords#create
#        new_admin_password GET    /admins/password/new(.:format)    devise/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format)   devise/passwords#edit
#                           PATCH  /admins/password(.:format)        devise/passwords#update
#                           PUT    /admins/password(.:format)        devise/passwords#update
# cancel_admin_registration GET    /admins/cancel(.:format)          devise/registrations#cancel
#        admin_registration POST   /admins(.:format)                 devise/registrations#create
#    new_admin_registration GET    /admins/sign_up(.:format)         devise/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)            devise/registrations#edit
#                           PATCH  /admins(.:format)                 devise/registrations#update
#                           PUT    /admins(.:format)                 devise/registrations#update
#                           DELETE /admins(.:format)                 devise/registrations#destroy
#              admin_unlock POST   /admins/unlock(.:format)          devise/unlocks#create
#          new_admin_unlock GET    /admins/unlock/new(.:format)      devise/unlocks#new
#                           GET    /admins/unlock(.:format)          devise/unlocks#show
#          new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
#              user_session POST   /users/sign_in(.:format)          devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)         devise/sessions#destroy
#             user_password POST   /users/password(.:format)         devise/passwords#create
#         new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#                           PATCH  /users/password(.:format)         devise/passwords#update
#                           PUT    /users/password(.:format)         devise/passwords#update
#  cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
#         user_registration POST   /users(.:format)                  devise/registrations#create
#     new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
#                           PATCH  /users(.:format)                  devise/registrations#update
#                           PUT    /users(.:format)                  devise/registrations#update
#                           DELETE /users(.:format)                  devise/registrations#destroy
#         user_confirmation POST   /users/confirmation(.:format)     devise/confirmations#create
#     new_user_confirmation GET    /users/confirmation/new(.:format) devise/confirmations#new
#                           GET    /users/confirmation(.:format)     devise/confirmations#show
#               user_unlock POST   /users/unlock(.:format)           devise/unlocks#create
#           new_user_unlock GET    /users/unlock/new(.:format)       devise/unlocks#new
#                           GET    /users/unlock(.:format)           devise/unlocks#show
#                      home GET    /home(.:format)                   redirect(301, /)
#                      root GET    /                                 high_voltage/pages#show {:id=>"home"}
#                      page GET    /*id                              high_voltage/pages#show
#

Rails.application.routes.draw do
  get 'reports/index'

  resources :bills, only: [:index, :new, :create, :edit, :update]
  resources :orders, only: [:index, :new, :create]
  resources :companies
  resources :products

  devise_for :admins
  devise_for :users
end
