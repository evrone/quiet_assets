if Rails.application.config.ultimate_log_silencer.assets_logger_off
  Rails.application.assets.logger = Logger.new(RUBY_PLATFORM =~ /(win|w)32$/ ? "NUL" : "/dev/null")
end

if Rails.application.config.ultimate_log_silencer.rack_logger_assets_off
  Rails::Rack::Logger.class_eval do
    def call_with_quiet_assets(env)
      previous_level = Rails.logger.level
      Rails.logger.level = Logger::ERROR  if Rails.application.config.ultimate_log_silencer.assets_path_regexp =~ env['PATH_INFO']
      call_without_quiet_assets(env).tap do
        Rails.logger.level = previous_level
      end
    end
    alias_method_chain :call, :quiet_assets
  end
end
