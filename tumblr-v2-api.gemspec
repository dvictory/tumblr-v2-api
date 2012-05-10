# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tumblr-v2-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Derek Victory"]
  gem.email         = ["derekvictory@yahoo.com"]
  gem.description   = %q{A simple wrapper around Tumblr API v2}
  gem.summary       = %q{Tumblr API v2 wrapper}
  gem.homepage      = "https://github.com/dvictory"

  gem.add_development_dependency "rspec"
  gem.add_dependency 'faraday', '~> 0.8'
  gem.add_dependency 'multi_json', '~> 1.3'
  gem.add_dependency 'simple_oauth', '~> 0.1.6'

  #gem.rubyforge_project = "tumblr-v2-api"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tumblr-v2-api"
  gem.require_paths = ["lib"]
  gem.version       = TumblrV2Api::Version
end
