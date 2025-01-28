Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  devise_for :users #devise を使用する際に URL として users を含むことを示しています。
  root to: "homes#top"
  resources :books, only: [:new, :create, :index, :show, :destroy]
  get "/homes/about" => "homes#about", as: "about"
end
