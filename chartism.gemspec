lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chartism/version'

Gem::Specification.new do |s|
  s.name          = 'chartism'
  s.version       = Chartism::VERSION
  s.authors       = ['noma4i']
  s.email         = ['noma4i@gmail.com']
  s.summary       = %q{Chartism for Chartist.js - Simple responsive charts}
  s.description   = %q{Chartist.js for Rails}
  s.homepage      = 'https://github.com/noma4i/chartism'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rake', '~> 10.0'
end
