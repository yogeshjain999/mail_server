Rails.application.routes.draw do
  devise_for :users

  resource :user, only: [:create]
  resource :session, only: [:create]

  resources :mails, only: [:create, :destroy, :update] do
    post :dispatch, action: :create, controller: :dispatch

    collection do
      get :inbox, action: :index, defaults: { status: 'inbox' }
      get :draft, action: :index, defaults: { status: 'draft' }
      get :sent, action: :index, defaults: { status: 'sent' }
      get :trash, action: :index, defaults: { status: 'trash' }
    end
  end
end
