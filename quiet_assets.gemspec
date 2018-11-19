Gem::Specification.new do |gem|
  gem.name          = 'quiet_assets'
  gem.version       = '1.1.1'
  gem.authors       = ['Dmitry Karpunin', 'Dmitry Vorotilin']
  gem.email         = ['koderfunk@gmail.com', 'd.vorotilin@gmail.com']
  gem.homepage      = 'http://github.com/evrone/quiet_assets'
  gem.description   = 'Quiet Assets turns off Rails asset pipeline log.'
  gem.summary       = 'Turns off Rails asset pipeline log.'
  gem.licenses      = ['MIT', 'GPL']

  gem.post_install_message = "*** quiet_assets deprecation
The `quiet_assets` gem is now deprecated. The functionality has been pulled into `sprockets-rails` as of version 3.1.0.
Add the following line to `config/environments/development.rb`:

    config.assets.quiet = true

This is the default for new rails apps."

  gem.files         = %w(LICENSE README.md lib/quiet_assets.rb quiet_assets.gemspec)
  gem.require_paths = %w(lib)
  gem.test_files    = %w(test/test_quiet_assets.rb)

  gem.add_dependency 'railties', '>= 3.1', '<= 5.3'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'tzinfo'
end
