Rails.application.routes.draw do

  resources :manufacturer do
    resources :cars
  end

end
