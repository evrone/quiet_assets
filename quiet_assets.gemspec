Gem::Specification.new do |gem|
  gem.name          = 'quiet_assets'
  gem.version       = '1.0.2'
  gem.authors       = ['Dmitry Karpunin', 'Dmitry Vorotilin']
  gem.email         = ['koderfunk@gmail.com', 'd.vorotilin@gmail.com']
  gem.homepage      = 'http://github.com/evrone/quiet_assets'
  gem.description   = 'Quiet assets turn off rails assets log.'
  gem.summary       = 'Turn off rails assets log.'

  gem.files         = %w(LICENSE README.md lib/quiet_assets.rb quiet_assets.gemspec)
  gem.require_paths = %w(lib)
  gem.test_files    = %w(test/test_quiet_assets.rb)

  gem.add_dependency 'railties', '>= 3.1', '< 5.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'tzinfo'
end
