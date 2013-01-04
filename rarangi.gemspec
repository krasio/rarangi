# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rarangi/version'

Gem::Specification.new do |gem|
  gem.name          = "rarangi"
  gem.version       = Rarangi::VERSION
  gem.authors       = ["Krasimir Angelov"]
  gem.email         = ["krasio@codingspree.net"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activemodel", "3.2.10"
  gem.add_dependency "activerecord", "3.2.10"
  gem.add_dependency "pg"
  gem.add_dependency "minimapper"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "debugger"
  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "rspec"
end
