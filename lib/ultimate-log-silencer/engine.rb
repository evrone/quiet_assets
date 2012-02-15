require "ultimate-log-silencer/configuration"

module Ultimate
  module Log
    module Silencer
      class Engine < ::Rails::Engine
        config.ultimate_log_silencer = Ultimate::Log::Silencer::Configuration.new
        initializer "ultimate-log-sillencer.quiet_assets", :after => "sprockets.environment" do
          require "ultimate-log-silencer/clear_logs"
          require "ultimate-log-silencer/quiet_assets"
        end
      end
    end
  end
end
