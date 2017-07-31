Rails.application.routes.draw do
  match '/graphql' => 'graphql#create', via: %i[get post]

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  get '*path', to: 'home#index', constraints: lambda { |request|
    !request.xhr? && request.format.html?
  }
end
