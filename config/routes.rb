Dudebeerme::Application.routes.draw do

  # set up devise for brewers (users)
  devise_for :brewers

  # each brewer has many recipes and many comments
  resources :brewers do
    resources :recipes, :comments
  end

  # each recipe has many ingredients and many comments
  resources :recipes do
    resources :ingredients, :comments
  end

  # setup static pages
  get "static/home"
  get "static/faq"
  get "static/about"

  # set up the root route
  root to: "static#home"

end
