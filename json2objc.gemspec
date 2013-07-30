# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json2objc/version'

Gem::Specification.new do |spec|
  spec.name          = "json2objc"
  spec.version       = Json2objc::VERSION
  spec.authors       = ["Ivan Ostafiychuk"]
  spec.email         = ["iostaf@gmail.com"]
  spec.description   = %q{JSON to Objective-C conversion helper}
  spec.summary       = %q{JSON to Objective-C conversion helper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "thor"
end
