Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/data_inputs/output', controller: 'data_inputs'
      resources :data_inputs, only: [:create]
    end
  end
end
