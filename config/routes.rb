Rails.application.routes.draw do

  devise_for :users

  root to: 'application#home'

  namespace :mobile_api, path: :api, defaults: {format: :json} do
    namespace 'v1', path: '1' do
      resource  :login, only: %i(create)
      resources :users, only: %i(create)
    end
  end

end
