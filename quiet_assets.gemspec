require File.expand_path('../lib/quiet_assets/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "quiet_assets"
  gem.version       = QuietAssets::VERSION
  gem.authors       = ["Dmitry Karpunin", "Dmitry Vorotilin"]
  gem.email         = ["koderfunk@gmail.com", "d.vorotilin@gmail.com"]
  gem.homepage      = "http://github.com/evrone/quiet_assets"
  gem.description   = "Quiet assets turn off rails assests log."
  gem.summary       = "Turn off rails assests log."

  gem.files         = `git ls-files`.split("\n")
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", "~> 3.1"
end
