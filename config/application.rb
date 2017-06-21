require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module ExampleApiCodika
  class Application < Rails::Application
  end
end
