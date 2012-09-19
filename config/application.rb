require File.expand_path('../boot', __FILE__)

require 'rails/all'


if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module TestFS
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.i18n.default_locale = :ru
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end
