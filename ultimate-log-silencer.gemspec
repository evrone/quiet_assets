# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ultimate-log-silencer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "ultimate-log-silencer"
  gem.version       = Ultimate::Log::Silencer::VERSION
  gem.authors       = ["Dmitry KODer Karpunin"]
  gem.email         = ["koderfunk@gmail.com"]
  gem.homepage      = "http://github.com/evrone/ultimate-log-silencer"
  gem.description   = %q{Ultimate Log Silencer mutes assets pipeline log-messages.}
  gem.summary       = %q{Ultimate Log Silencer mutes assets pipeline log-messages.}

  gem.add_dependency "rails", "~> 3.1"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

end
