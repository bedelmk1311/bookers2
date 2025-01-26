Rails.application.routes.draw do
  devise_for :users #devise を使用する際に URL として users を含むことを示しています。
  root to: "homes#top"
  get 'homes/about'
end
