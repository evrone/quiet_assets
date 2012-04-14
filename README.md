# Quiet assets

Quiet assets turn off assets pipeline log, kind of:

    Started GET "/assets/application.js?body=1" for 127.0.0.1 at 2012-02-13 13:24:04 +0400
    Served asset /application.js - 304 Not Modified (8ms)

Support Ruby on Rails ~> 3.1

## Installation

Add this line to your application's Gemfile:

    gem 'quiet_assets', :group => :development

And then execute:

    $ bundle

## Usage

Nothing to do, but if you want to temporarily turn on back assets' log just write:

    config.quiet_assets = false

## License

Dual licensed under the MIT and GPL licenses:

+ http://www.opensource.org/licenses/mit-license.php
+ http://www.gnu.org/licenses/gpl.html

Copyright © 2011-2012 Dmitry [@KODerFunk](https://github.com/KODerFunk) Karpunun, Dmitry [@route](https://github.com/route) Vorotilin / [Evrone.com](http://evrone.com)
