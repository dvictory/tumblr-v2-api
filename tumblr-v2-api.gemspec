# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tumblr-v2-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Derek Victory"]
  gem.email         = ["derekvictory@yahoo.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tumblr-v2-api"
  gem.require_paths = ["lib"]
  gem.version       = Tumblr::V2::Api::VERSION
end
