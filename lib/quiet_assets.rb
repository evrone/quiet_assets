require 'logger'

module QuietAssets
  class Engine < ::Rails::Engine
    # Set as true but user can override it
    config.quiet_assets = true

    initializer 'quiet_assets', :after => 'sprockets.environment' do |app|
      next unless app.config.quiet_assets
      # Parse PATH_INFO by assets prefix
      ASSETS_PREFIX = "/#{app.config.assets.prefix[/\A\/?(.*?)\/?\z/, 1]}/"
      KEY = 'quiet_assets.old_level'
      app.config.assets.logger = false

      # Just create an alias for call in middleware
      Rails::Rack::Logger.class_eval do
        def call_with_quiet_assets(env)
          begin
            if env['PATH_INFO'].start_with?(ASSETS_PREFIX)
              env[KEY] = Rails.logger.level
              Rails.logger.level = Logger::ERROR
            end
            call_without_quiet_assets(env)
          ensure
            Rails.logger.level = env[KEY] if env[KEY]
          end
        end
        alias_method_chain :call, :quiet_assets
      end
    end
  end
end
