# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'myki/version'

Gem::Specification.new do |spec|
  spec.name          = "myki"
  spec.version       = '0.0.0'
  spec.authors       = ["Luke Poskitt"]
  spec.email         = ["luke.poskitt@gmail.com"]

  spec.summary       = %q{Gem for interfacing with the Myki online account management portal.}
  spec.description   = %q{Provides a simple interface to the Myki online account management portal functionality for registered Myki users.}
  spec.homepage      = "https://github.com/ltp/gem-myki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
