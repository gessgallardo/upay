# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$:.push lib

require 'upay/version'

Gem::Specification.new do |spec|
  spec.name          = "upay"
  spec.version       = Upay::VERSION

  spec.summary     = "uPay"
  spec.description = "A simple payu payment sdk gem"
  spec.authors     = ["Gess Gallardo"]
  spec.email       = 'hola@gessgallardo.com'
  spec.homepage    = 'http://rubygems.org/gems/upay'
  spec.license     = "MIT"

  spec.rubyforge_project = "upay"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "factory_girl", "~> 4.0"
  spec.add_development_dependency "faker"


  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"
  spec.add_runtime_dependency "veto"

end
