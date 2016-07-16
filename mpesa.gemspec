lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mpesa/version'

Gem::Specification.new do |spec|
  spec.name          = 'mpesa'
  spec.version       = MPesa::VERSION
  spec.date          = Time.new.getutc.strftime('%Y-%m-%d')
  spec.authors       = ["Job King'ori Maina"]
  spec.email         = ['j@kingori.co']
  spec.homepage      = 'http://itsmrwave.github.io/mpesa-gem'
  spec.license       = 'MIT'
  spec.description   = 'Make authenticated MPESA G2 API calls without the fuss!'
  spec.summary       = <<-EOF
    Make authenticated MPESA G2 API calls without the fuss! Handles all the SOAP
    stuff abstracting any direct interaction with the API endpoints so that you
    can focus on what matters. Building awesome!
  EOF

  spec.files         = `git ls-files`.split($/).reject { |f| f.match(%r{^(spec)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.41.2'

  spec.add_runtime_dependency 'savon', '~> 2.11', '>= 2.11.1'
end
