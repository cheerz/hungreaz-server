Rails.application.routes.draw do

  devise_for :users

  root to: 'application#home'

  namespace :mobile_api, path: :api, defaults: {format: :json} do
    namespace 'v1', path: '1' do
      resource  :session, only: %i(create)
      resources :users, only: %i(create)
      resource  :user,  only: %i(show)
    end
  end

end
