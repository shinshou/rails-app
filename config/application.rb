require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #デフォルトの言語の変更
    config.i18n.default_locale = :ja
    #created_atとupdated_atの時間を日本時間に合わせる。
    config.time_zone = 'Tokyo'
  end
end
