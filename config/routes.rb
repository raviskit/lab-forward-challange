Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/data_inputs', controller: 'data_inputs', action: 'output'
    end
  end
end
