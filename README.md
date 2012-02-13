# Ultimate Log Silencer

Ultimate Log Silencer mutes assets pipeline log-messages, sort of:

```log
Started GET "/assets/application.js?body=1" for 127.0.0.1 at 2012-02-13 13:24:04 +0400
Served asset /application.js - 304 Not Modified (8ms)
```

Support Ruby on Rails 3.1, 3.2.

## Installation

Add this line to your application's Gemfile:

    gem 'ultimate-log-silencer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ultimate-log-silencer

## Usage

Nothing more, but you can change some options:

```ruby
# Assign null-logger for assets.
config.ultimate_log_silencer.assets_logger_off = false
# Off messages from Rack by request path.
config.ultimate_log_silencer.rack_logger_assets_off = true
# RegExp for detect request to assets.
config.ultimate_log_silencer.assets_path_regexp = /^\/assets\//
```

## License

Dual licensed under the MIT and GPL licenses:

+ http://www.opensource.org/licenses/mit-license.php
+ http://www.gnu.org/licenses/gpl.html

Copyright © 2011-2012 Dmitry KODer Karpunun / Evrone.com
