# Quiet Assets
[![Continuous Integration status](https://secure.travis-ci.org/evrone/quiet_assets.png)](http://travis-ci.org/evrone/quiet_assets)

Quiet Assets turns off the Rails asset pipeline log. This means that it suppresses messages in your development log such as:

    Started GET "/assets/application.js?body=1" for 127.0.0.1 at 2012-02-13 13:24:04 +0400
    Served asset /application.js - 304 Not Modified (8ms)

Support Ruby on Rails >= 3.1

## Installation

It is recommended that this gem only be used for development.
To install, add this line to development group in your Gemfile:

    gem 'quiet_assets', group: :development

Then, from the command line, run:

    $ bundle

## Usage

Simply installing Quiet Assets will suppress the log messages automatically. However, if you wish to temporarily re-enable the logging of the asset pipeline messages,
place the following in your `config/application.rb` file:

    config.quiet_assets = false

## License

Dual licensed under the MIT or GPL licenses:

+ http://www.opensource.org/licenses/mit-license.php
+ http://www.gnu.org/licenses/gpl.html

Copyright © 2011-2014 Dmitry [@KODerFunk](https://github.com/KODerFunk) Karpunun, Dmitry [@route](https://github.com/route) Vorotilin / [Evrone.com](http://evrone.com)
