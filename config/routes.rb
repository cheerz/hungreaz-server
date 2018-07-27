Rails.application.routes.draw do

  devise_for :users

  root to: 'application#home'

  namespace :mobile_api, path: :api, defaults: {format: :json} do
    namespace 'v1', path: '1' do
      resource  :session,          only: %i(create destroy)
      resources :users,            only: %i(create)
      resource  :user,             only: %i(show)
      resources :places,           only: %i(index create)
      resources :place_categories, only: %i(index)
      resources :events,           only: %i(create)
    end
  end

end
