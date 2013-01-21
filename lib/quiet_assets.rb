module QuietAssets
  class Middleware
    def initialize(app, assets_prefix)
      @app, @assets_prefix = app, assets_prefix
    end

    def call(env)
      if env['PATH_INFO'].start_with?(@assets_prefix)
        # Skip logger middleware if request is for assets.
        @app.instance_variable_get(:@app).call(env)
      else
        @app.call(env)
      end
    end
  end

  class Engine < ::Rails::Engine
    # Set as true but user can override it
    config.quiet_assets = true

    initializer 'quiet_assets' do |app|
      next unless app.config.quiet_assets

      app.config.assets.logger = false

      # Parse PATH_INFO by assets prefix
      assets_prefix = "/#{app.config.assets.prefix[/\A\/?(.*?)\/?\z/, 1]}/"
      app.middleware.insert_before(
        Rails::Rack::Logger, Middleware, assets_prefix
      )
    end
  end
end
