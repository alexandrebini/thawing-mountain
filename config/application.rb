require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module ThawingMountain
  class Application < Rails::Application
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sucker_punch
    config.eager_load_paths += %W[
      #{ config.root }/lib
      #{ config.root }/app/graph/types
      #{ config.root }/app/graph
    ]
  end
end
