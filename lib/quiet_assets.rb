module QuietAssets
  class Engine < ::Rails::Engine
    # Set as true but user can override it
    config.quiet_assets = true

    initializer 'quiet_assets', :after => 'sprockets.environment' do |app|
      next unless app.config.quiet_assets
      # Parse PATH_INFO by assets prefix
      ASSETS_PREFIX = "/#{app.config.assets.prefix[/\A\/?(.*?)\/?\z/, 1]}/"
      app.config.assets.logger = false

      # Just create an alias for call in middleware
      Rails::Rack::Logger.class_eval do
        def call_with_quiet_assets(env)
          old_logger_level, level = Rails.logger.level, Logger::ERROR
          # Increase log level because of messages that have a low level should not be displayed
          Rails.logger.level = level if env['PATH_INFO'].start_with?(ASSETS_PREFIX)
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
