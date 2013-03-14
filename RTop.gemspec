# -*- encoding: utf-8 -*-
require File.expand_path('../lib/RTop/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Feng"]
  gem.email         = ["mingliangfeng@gmail.com"]
  gem.description   = %q{Library for Taobao Open API }
  gem.summary       = %q{Quick start to use Taobao Open API.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "RTop"
  gem.require_paths = ["lib"]
  gem.version       = RTop::VERSION
  
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "thor"
  
  gem.add_dependency "httparty"
  
end
