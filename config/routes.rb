Rails.application.routes.draw do
  root to: 'stories#index'
  match '/graphql' => 'graphql#create', via: %i[get post]

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
end
