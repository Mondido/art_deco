require 'bundler/setup'
Bundler.setup
require 'art_deco'

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
end