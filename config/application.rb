require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module RaceCalendar
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/lib)
    config.filepicker_rails.api_key = ENV["FILEPICKER_KEY"]
  end
end
