lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'froyo_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'froyo_api'
  spec.version       = FroyoApi::VERSION
  spec.authors       = ['Maciej Małecki']
  spec.email         = ['smt116@gmail.com']
  spec.summary       = %q{Ruby gem for http://api.froyo.io}
  spec.description   = %q{}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'rest-client'
  spec.add_runtime_dependency 'json'
end
