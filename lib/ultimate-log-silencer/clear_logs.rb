if Rails.application.config.ultimate_log_silencer.clear_logs
  include ActionView::Helpers::NumberHelper
  logs = File.join(Rails.root, 'log', '*.log')
  Dir[logs].each do |log|
    file_size = File.size? log
    if file_size.to_i > Rails.application.config.ultimate_log_silencer.max_log_size
      $stdout.puts "=> Ultimate Log Silencer: clearing #{log.gsub Rails.root.to_s, ''} (#{number_to_human_size file_size})"
      f = File.open log, "w"
      f.close
    end
  end
end
