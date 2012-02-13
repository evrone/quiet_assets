module Ultimate
  module Log::Silencer

    class Configuration

      # Assign null-logger for assets.
      attr_accessor :assets_logger_off

      # Off messages from Rack by request path.
      attr_accessor :rack_logger_assets_off

      # RegExp for detect request to assets.
      attr_accessor :assets_path_regexp

      def initialize
        # Set configuration defaults.
        @assets_logger_off = false
        @rack_logger_assets_off = true
        @assets_path_regexp = /^\/assets\//
      end

    end

  end
end
