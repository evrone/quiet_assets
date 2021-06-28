# PLEASE NOTE, THIS PROJECT IS NO LONGER BEING MAINTAINED

As of `sprockets-rails` version `3.1.0`, used in current versions of rails, this gem is deprecated.

The asset pipeline now supports a `quiet` option which suppresses output of asset requests:

```
# config/environments/development.rb

config.assets.quiet = true
```

Relevant PR: https://github.com/rails/sprockets-rails/pull/355

# Quiet Assets

[![Continuous Integration status](https://api.travis-ci.org/evrone/quiet_assets.svg)](http://travis-ci.org/evrone/quiet_assets)

Quiet Assets turns off the Rails asset pipeline log. This means that it suppresses messages in your development log such as:

    Started GET "/assets/application.js" for 127.0.0.1 at 2015-01-28 13:35:34 +0300
    Served asset /application.js - 304 Not Modified (8ms)

<a href="https://evrone.com/?utm_source=github.com">
  <img src="https://evrone.com/logo/evrone-sponsored-logo.png"
       alt="Sponsored by Evrone" width="231">
</a>

Developed by <a href="https://evrone.com/quietassets?utm_source=github&utm_campaign=quietassets">Evrone team</a>.

## Getting Started

### Prerequisites

Support Ruby on Rails >= 3.1

### Installation

It is recommended that this gem only be used for development.
To install, add this line to development group in your Gemfile:

    gem 'quiet_assets', group: :development

Then, from the command line, run:

    $ bundle

### Usage

Simply installing Quiet Assets will suppress the log messages automatically. However, if you wish to temporarily re-enable the logging of the asset pipeline messages,
place the following in your `config/application.rb` file:

    config.quiet_assets = false

If you need to supress output for other paths you can do so by specifying:

    config.quiet_assets_paths << '/silent/'

## Contributing

Please read [Code of Conduct](CODE-OF-CONDUCT.md) and [Contributing Guidelines](CONTRIBUTING.md) for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/evrone/quiet_assets/tags). 

## Changelog

The changelog is [here](CHANGELOG.md).

## Authors

* [Dmitry Karpunin](https://github.com/KODerFunk)
* [Dmitry Vorotilin](https://github.com/route) 

See also the list of [contributors](https://github.com/evrone/quiet_assets/contributors) who participated in this project.

## License

This project is licensed under the [MIT License](LICENSE).
