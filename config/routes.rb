Rails.application.routes.draw do
  namespace :user do
    get 'bookmarks/create'
    get 'bookmarks/destroy'
  end
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :user do
    root to: 'homes#top'
    resources :contents, only:[:index, :show, :edit, :new, :create, :destroy, :update]
    resources :contents do
      resource :favorites, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    resources :users, only:[:index, :show, :edit, :update]
    get 'users/unsubscribe/:id' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/unsubscribe' => 'users#destroy', as: 'destroy'
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
    post 'contacts/back' => 'contacts#back', as: 'back'
    get 'thanks', to: 'contacts#thanks', as: 'thanks'
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :contents, only:[:index, :show, :edit, :destroy, :update]
    resources :genres, only:[:index, :create, :edit, :destroy, :update]
    resources :users, only:[:index, :show, :edit, :update]
  end
end
