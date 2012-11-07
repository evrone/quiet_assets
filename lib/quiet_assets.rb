require "quiet_assets/version"

module QuietAssets
  class Engine < ::Rails::Engine
    # Set as true and no additions, but user can override it
    config.quiet_assets = true
    config.quiet_assets_checks = nil

    initializer "quiet_assets", :after => "sprockets.environment" do |app|
      if app.config.quiet_assets == true

        # Parse PATH_INFO by assets prefix
        ASSETS_PREFIX = "/#{app.config.assets.prefix[/\A\/?(.*?)\/?\z/, 1]}/"

        # silences sprockets logging
        app.config.assets.logger = false

        # if no addition lambdas passed, just quiet assets
        if !app.config.quiet_assets_checks then app.config.quiet_assets_checks = Array.new end
        assets_path_check = ->(env){ env['PATH_INFO'].start_with?(ASSETS_PREFIX) }
        app.config.quiet_assets_checks.unshift(assets_path_check)

        # Just create an alias for call in middleware
        Rails::Rack::Logger.class_eval do
          def call_with_quiet_assets(env)
            old_logger_level, level = Rails.logger.level, Logger::ERROR
            # Increase log level because of messages that have a low level should not be displayed
            Rails.application.config.quiet_assets_checks.each do |check|
              Rails.logger.level = level if check.call(env)
            end
            call_without_quiet_assets(env)
          ensure
            # Return back
            Rails.logger.level = old_logger_level
          end
          alias_method_chain :call, :quiet_assets
        end
      end
    end
  end
end
