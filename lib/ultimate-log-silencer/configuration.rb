module Ultimate
  module Log::Silencer

    class Configuration

      # Assign null-logger for assets.
      attr_accessor :assets_logger_off

      # Off messages from Rack by request path.
      attr_accessor :rack_logger_assets_off

      # RegExp for detect request to assets.
      attr_accessor :assets_path_regexp

      # Allow remove logs exceeded max_log_size.
      attr_accessor :clear_logs

      # Max allowed log size.
      attr_accessor :max_log_size

      def initialize
        # Set configuration defaults.
        @assets_logger_off = false
        @rack_logger_assets_off = true
        @assets_path_regexp = /^\/assets\//
        @clear_logs = false
        @max_log_size = 2.megabytes
      end

    end

  end
end
