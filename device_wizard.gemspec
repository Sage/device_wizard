# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'device_wizard/version'

Gem::Specification.new do |spec|
  spec.name          = "device_wizard"
  spec.version       = DeviceWizard::VERSION
  spec.authors       = ["vaughanbrittonsage"]
  spec.email         = ["vaughan.britton@sage.com"]

  spec.summary       = 'A fast & lightweight device detection framework.'
  spec.description   = "A device detection framework that is not based on lookup dictionaries, which makes this framework extra light weight, ultra fast and future proof as new devices don't need to be added into the framework."
  spec.homepage      = "https://github.com/sage/device_wizard"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
