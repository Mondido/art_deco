# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'art_deco/version'

Gem::Specification.new do |spec|
  spec.name          = "art_deco"
  spec.version       = ArtDeco::VERSION
  spec.authors       = ["Robert Falkén"]
  spec.email         = ["robert@robertfalken.se"]
  spec.summary       = %q{Implementation of the decorator design pattern.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails"
end
