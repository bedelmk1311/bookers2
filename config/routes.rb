Rails.application.routes.draw do
  devise_for :users #devise を使用する際に URL として users を含むことを示しています。
  root to: "homes#top"
  resources :post_images, only: [:new, :index, :show]
  get "/homes/about" => "homes#about", as: "about"
end
