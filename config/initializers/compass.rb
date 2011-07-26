# TODO: Remove this when compass works proparly with rails sprockets
module Compass
end
require 'compass/util'
require 'compass/browser_support'
require 'compass/sass_extensions'
require 'compass/version'
require 'compass/errors'

Protsahan::Application.configure do
  config.sass.load_paths << "#{Rails.root}/app/assets/stylesheets"
  config.sass.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
  config.sass.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/blueprint/stylesheets"
end
