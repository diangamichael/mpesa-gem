# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mpesa/version'

Gem::Specification.new do |spec|
  spec.name          = 'mpesa'
  spec.version       = MPesa::VERSION
  spec.date          = Time.new.getutc.strftime('%Y-%m-%d')
  spec.authors       = ["Job King'ori Maina"]
  spec.email         = ['j@kingori.co']
  spec.description   = 'Make authenticated MPESA G2 API calls without the fuss!'
  spec.summary       = 'Make authenticated MPESA G2 API calls without the fuss! Handles all the SOAP stuff abstracting any direct interaction with the API endpoints so that you can focus on what matters. Building awesome.'
  spec.homepage      = 'http://itsmrwave.github.io/mpesa-gem'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency 'savon', '~> 2.11', '>= 2.11.1'
end
