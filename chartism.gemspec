lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chartism/version'

Gem::Specification.new do |spec|
  spec.name          = 'chartism'
  spec.version       = Chartism::VERSION
  spec.authors       = ['noma4i']
  spec.email         = ['noma4i@gmail.com']
  spec.summary       = %q{Chartism for Chartist.js - Simple responsive charts}
  spec.description   = %q{Chartist.js for Rails}
  spec.homepage      = 'https://github.com/noma4i/chartism'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
